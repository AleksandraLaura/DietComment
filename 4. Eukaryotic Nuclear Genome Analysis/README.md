# Authenticity of the metagenome from Reynoso-García et al 2023.

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
We next mapped all reads against the RefSeq (release number 213), the NCBI nt (downloaded on 16th Sept. 2022) and the PhyloNorway plant database (Database composition and construction followed Kjaer et al 2022 and the build is described in details here: https://github.com/miwipe/KapCopenhagen).

First we make a list of the samples 
```
ll *fastq | awk '{print $9}' > sample.list
```

And then make a bash script that maps all files against all databases

```
./bowtie2_map.sh
```




