# Authentication of the metagenomes from Reynoso-García et al 2023.

This is a guide that walks you through the eukaryotic reanalysis of the Reynoso-García et al dataset. We applied the [Holi pipeline](https://github.com/ancient-eDNA/Holi) that has been used to authenticate a series of ancient metagenomic datasets ([Pedersen et al. 2016](https://www.nature.com/articles/nature19085), [Seersholm et al. 2016](https://doi.org/10.1038/ncomms13389), [Jensen et al. 2019](https://doi.org/10.1038/s41467-019-13549-9), [Ardelean et al 2020](https://doi.org/10.1038/s41586-020-2509-0), [Pedersen et al. 2021](https://doi.org/10.1093/molbev/msab351), [Kjær et al. 2022](https://doi.org/10.1038/s41586-022-05453-y) among others). It builds on the simple principles that raw sequence data (reads) are trimmed, quality controlled and dereplicated. Reads are hereafter competitively mapped against a comprehensive set of databases allowing each read an equal chance to align against all reference genomes, parsing all alignments that can be found. All alignments within each read are hereafter parsed to an LCA algorithm that given a set of thresholds parses alignment within a set read to reference similarity (normally 95-100% similarity in ancient DNA studies). This while performing the LCA (embedded in [metaDMG](https://github.com/metaDMG-dev/metaDMG-core)), misincorporations matrices are produced and later parsed for ancient DNA authenticity calculating the cytosine to thymine misincorporations due to DNA damage (deamination). 
At the same time, metaDMG computes a series of statistics that can be used to validate the DNA damage estimates and other ancient DNA characteristics such as mean read lengths classified to a given taxonomic level.

## Dereplication

We dereplicated the two samples to remove identical sequences using vsearch (https://github.com/torognes/vsearch).

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
nam=/taxonomy/ncbi_taxonomy3dec2020/names.dmp
nod=/taxonomy/ncbi_taxonomy3dec2020/nodes.dmp
acc=/taxonomy/ncbi_taxonomy3dec2020/combined_taxid_accssionNO_20201120.gz
```

Generating the config file and computing the misincorporation statistics, and converting the metaDMG output to a .csv file
```
metaDMG config *.sam.gz --names $nam --nodes $nod --acc2tax $acc

metaDMG compute config95sim.yaml

metaDMG convert --add-fit-predictions --output diet_data.csv

```

Next execute the Rscript to filter, plot and output the data (our output file from metaDMG can be downloaded using wget https://sid.erda.dk/share_redirect/Hcoy2JC4bM; mv Hcoy2JC4bM diet_data.csv).
```
cd results/
Rscript analysis_script.R "diet_data.csv"
```
Now double-check that the results are identical to the plots in the results folder.





