# Authentication of the metagenomes from Reynoso-García et al 2023.

This is a guide that walks you through the eukaryotic reanalysis of the Reynoso-García et al dataset. We applied the [Holi pipeline](https://github.com/ancient-eDNA/Holi) that has been used to authenticate a series of ancient metagenomic datasets ([Pedersen et al. 2016](https://www.nature.com/articles/nature19085), [Seersholm et al. 2016](https://doi.org/10.1038/ncomms13389), [Jensen et al. 2019](https://doi.org/10.1038/s41467-019-13549-9), [Ardelean et al 2020](https://doi.org/10.1038/s41586-020-2509-0), [Pedersen et al. 2021](https://doi.org/10.1093/molbev/msab351), [Kjær et al. 2022](https://doi.org/10.1038/s41586-022-05453-y) among others). It builds on the simple principles that raw sequence data (reads) are trimmed, quality controlled and dereplicated. Reads are hereafter competitively mapped against a comprehensive set of databases allowing each read an equal chance to align against all reference genomes, parsing all alignments that can be found. All alignments within each read are hereafter parsed to an LCA algorithm that given a set of thresholds parses alignment within a set read to reference similarity (normally 95-100% similarity in ancient DNA studies). This while performing the LCA (embedded in [metaDMG](https://github.com/metaDMG-dev/metaDMG-core)), misincorporations matrices are produced and later parsed for ancient DNA authenticity calculating the cytosine to thymine misincorporations due to DNA damage (deamination). 
At the same time, metaDMG computes a series of statistics that can be used to validate the DNA damage estimates and other ancient DNA characteristics such as mean read lengths classified to a given taxonomic level.

## Adapter Removal and Colapsing of the raw fastq files

Using AdapterRemoval (v. 2.3.3) we removed the adapters and then combined the collapsed, non-collapsed R1 and non-collapsed R2 files. 

```
AdapterRemoval --file1 $file_1.fastq --file2 $file_1.fastq --basename $file --collapse

cat $file.collapsed $file.collapsed.truncated $file.singleton.truncated $file.pair1.truncated $file.pair2.truncated > output/$file.combined.fastq
```


## Dereplication

We dereplicated the samples to remove identical sequences using vsearch (https://github.com/torognes/vsearch).

```
for file in *.combined.fastq
do
vsearch --fastx_uniques $file --fastqout $file.vs.fq --minseqlength 30 --strand both &
done
```
## Mapping
We next mapped all reads against the RefSeq (release number 213), the NCBI nt (downloaded on 16th Sept. 2022) and the PhyloNorway plant database (Database composition and construction followed Kjaer et al 2022 and the build is described in details here: https://github.com/miwipe/KapCopenhagen, including the download of the NCBI taxonomy into a /taxonomy/ folder, see details here https://github.com/miwipe/ngsLCA).

First, we link the data to the data folder and make a list of the samples 

```
ln -s ../*.fastq data/
ll data/*fastq | awk '{print $9}' > sample.list
```

Then make a bash script that maps all files against all databases

```
cd results/
./bowtie2_map.sh
```
### LCA and metaDMG analysis 

First, we generate config.yaml file and specify files, taxonomy paths etc. also in the config file other LCA and metaDMG settings can be set. We ran data using first the 95-100% similarity threshold, we also changed the number of positions to print to 30 (for aesthetic reasons). 

Setting variables
```
acc2tax=/ncbi_taxonomy/combined_accession2taxid_20221112.gz
nodes=/ncbi_taxonomy/nodes.dmp
names=/ncbi_taxonomy/names.dmp
```

Generating the metaDMG output follows a series of commands, first we make a text file with sample names, then reduce the header using compressbam, remove sequences longer than 200Bp and lastly parse these through metaDMG lca, dfit and aggregate.
```
ll *.col.sorted.sam.gz | awk '{print $9}' | cut -f1 -d. > sample.list

cat sample.list | parallel -j 4 '/projects/lundbeck/people/npl206/programmes/ngsDMG/metaDMG-cpp/misc/compressbam --threads 1 --input {}.col.sorted.sam.gz --output {}.merged.bam'

cat sample.list | parallel -j 2 'samtools view -h {}.merged.bam  | awk '\''BEGIN {OFS="\t"} /^@/ || (length($10) < 200)'\'' | samtools view -b -o {}.filtered199.sort.bam'

cat sample.list | parallel -j 2 '/projects/lundbeck/people/npl206/programmes/ngsDMG/metaDMG-cpp/metaDMG-cpp lca --names $names --nodes $nodes --acc2tax $acc2tax --sim_score_low 0.95 --sim_score_high 1.0 --how_many 30 --weight_type 1 --fix_ncbi 0 --threads 4 --bam {}.filtered199.sort.bam --out_prefix {}.filtered199.sort'

cat sample.list | parallel -j 2 '/projects/lundbeck/people/npl206/programmes/ngsDMG/metaDMG-cpp/metaDMG-cpp dfit {}.filtered199.sort.bdamage.gz --threads 6 --names $names --nodes $nodes --showfits 2 --nopt 10 --nbootstrap 20 --doboot 1 --seed 1234 --lib ds --out {}.filtered199.sort'

cat sample.list | parallel -j 2 'metaDMG-cpp aggregate {}.filtered199.sort.bdamage.gz  --nodes $nodes --names $names --lcastat {}.filtered199.sort.stat.gz --dfit {}.filtered199.sort.dfit.gz'

for file in *.sort.bdamage.gz.stat.gz ;  do echo "$file"; zcat "$file" | tail -n +2| awk -v filename="$file" '{print filename "\t" $0}' >> metadmg_data2.tsv ; done
zcat *.sort.bdamage.gz.stat.gz | head -1 > metadmg_header.tsv
cat metadmg_header.tsv metadmg_data2.tsv > metadmg_data_final.tsv # OBS add the string "sample" to the first row in the header using tab seperated format
```

Next execute the Rscript to filter, plot and output the data (our output file from metaDMG can be downloaded using wget https://sid.erda.dk/share_redirect/Hcoy2JC4bM; mv Hcoy2JC4bM diet_data.csv).
```
cd results/
Rscript analysis_script.R "diet_data.csv"
```
The resulting plots can be found here: [Figure 1a](https://github.com/AleksandraLaura/DietComment/blob/main/3.%20Eukaryotic%20Nuclear%20Genome%20Analysis/results/Damage_significance_Eukatota95sim.pdf) and [Figure 1b](https://github.com/AleksandraLaura/DietComment/blob/main/3.%20Eukaryotic%20Nuclear%20Genome%20Analysis/results/density_meanlength.pdf)





