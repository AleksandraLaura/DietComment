# Authentication of the metagenomes from Reynoso-García et al 2023.

This is a guide that walks you through the eukaryotic reanalysis of the Reynoso-García et al dataset. We have here adobted the Holi pipeline that have been used to authenticate a series of ancient metagenomic datasets (Pedersen et al. 2016, Seersholm et al. 2016, Jensen et al. 2019, Ardelean et al 2020, Pedersen et al. 2021, Kjær et al. 2022 among others). It builds on the simple principles that raw sequence data (reads) are trimmed, quality controlled and dereplicated. QC'ed reads are hereafter competitively mapped against a comprehensive set of database allowing each read an equal chance to align against all reference genomes, parsing all alignments that can be found. All alignments within each read are hereafter parsed to an LCA algorithm that given a set of thresholds parses alignment within a set read to reference similarity (normally 95-100% similarity in ancient DNA studies). This while performing the LCA (embedded in metaDMG), misincorporations matrices are produced and later parsed for ancient DNA authenticity calculating the cytosine to thymin misincorporations due to DNA damage (deamination). 
At the same time metaDMG computes a series of statistics that furthermore can be used to validate the DNA damage estimates and other ancient DNA charateristics such as mean readlength classified to a given taxonomic level. 

## Dereplication

We initially dereplicated the two samples to remove identical sequences using vsearch (https://github.com/torognes/vsearch).

```
for file in *.combined.fastq
do
vsearch --fastx_uniques $file --fastqout $file.vs.fq --minseqlength 30 --strand both &
done
```
## Mapping
We next mapped all reads against the RefSeq (release number 213), the NCBI nt (downloaded on 16th Sept. 2022) and the PhyloNorway plant database (Database composition and construction followed Kjaer et al 2022 and the build is described in details here: https://github.com/miwipe/KapCopenhagen, including the download of the NCBI taxonomy into a /taxonomy/ folder).

First we link the data to data folder and make a list of the samples 

```
ln -s ../*.fastq data/
ll data/*fastq | awk '{print $9}' > sample.list
```

And then make a bash script that maps all files against all databases

```
cd results/
./bowtie2_map.sh
```
### LCA and metaDMG analysis 

First we generate config.yaml file and specify files, taxonomy paths etc. also in the config file other lca and metaDMG settings can be set. We ran data using first the 95-100% similarity threshold and next relaxed the criteria and ran 92-100% similarity, we also changed the number of positions to print to 30 (for aesthetic reasons). 
```
nam=/taxonomy/ncbi_taxonomy3dec2020/names.dmp
nod=/taxonomy/ncbi_taxonomy3dec2020/nodes.dmp
acc=/taxonomy/ncbi_taxonomy3dec2020/combined_taxid_accssionNO_20201120.gz
```


```
metaDMG config *.sam.gz --names $nam --nodes $nod --acc2tax $acc

metaDMG compute config92sim.yaml
metaDMG compute config95sim.yaml

metaDMG convert --add-fit-predictions --output SRR95_metaDMGout.csv
metaDMG convert --add-fit-predictions --output SRR92_metaDMGout.csv
```
Lastly, we merge the two metaDMG outputs by removing the header of one file and concatenating both.

```
tail -n +2 SRR92_metaDMGout.csv > SRR92_metaDMGout_noHeader.csv
cat SRR95_metaDMGout.csv SRR92_metaDMGout_noHeader.csv > SRR_metaDMGout.csv
```

Next execute the Rscript to filter, plot and output the data
```
Rscript analysis_script.R "SRR_metaDMGout.csv"

```
Now double-check that the results are identical to the plots in the plots folder. 





