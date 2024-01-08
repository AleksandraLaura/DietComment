# metaWrap (1.3.2)

## Make index to remove human sequences
(as followed [here](https://github.com/bxlab/metaWRAP/blob/master/installation/database_installation.md#making-host-genome-index-for-bmtagger))
```
mkdir BMTAGGER_INDEX
cd BMTAGGER_INDEX
wget ftp://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/*fa.gz
gunzip *fa.gz
cat *fa > hg38.fa
rm chr*.fa

bmtool -d hg38.fa -o hg38.bitmask
srprism mkindex -i hg38.fa -o hg38.srprism -M 100000

BMTAGGER_DB=/path/to/your/index/BMTAGGER_INDEX

```

## Run metaWrap (1.3.2)
```
SAMPLE_LIST=samplelist.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)

#Note that adapters were already removed from the neanderthal samples therefore the option "--skip-trimming" was added and the same file was provided for both option "-1" and "-2"
metaWRAP read_qc -1 raw_fastq/${SAMPLE}_1.fastq.gz -2 raw_fastq/${SAMPLE}_2.fastq.gz -o metawrap_output/$SAMPLE -t 5
```

##Run BMTagger seperatly for the Neanderthal data (based on the [source code](https://github.com/bxlab/metaWRAP/blob/master/bin/metawrap-modules/read_qc.sh))
```
/apps/conda/metawrap-mg-1.3.2/bin/bmtagger.sh -b /path/to/your/index/BMTAGGER_INDEX/hg38.bitmask -x /path/to/your/index/BMTAGGER_INDEX/hg38.srprism -T metawrap_output/ -q 1 -1 ERR4903912.fastq -o metawrap_output/ERR4903912.bmtagger.list

/apps/conda/metawrap-mg-1.3.2/bin/metawrap-scripts/skip_human_reads.py metawrap_output/ERR4903912.bmtagger.list raw_fastq/ERR4903912.fastq > metawrap_output/ERR4903912.clean.fastq

rm metawrap_output/ERR4903912.bmtagger.list
```

## Downsample for the two non-Puerto Rican datasets:
```
#in the metawrap output directory for the three datasets
#module load seqtk

mkdir downsampled

while read -r SAMPLE; do seqtk sample -s100 ${SAMPLE}/final_pure_reads_1.fastq 1399297 > downsampled/${SAMPLE}_downsampled_1.fastq; done < ../sample_list.txt

while read -r SAMPLE; do seqtk sample -s100 ${SAMPLE}/final_pure_reads_2.fastq 1399297 > downsampled/${SAMPLE}_downsampled_1.fastq; done < ../sample_list.txt

seqtk sample -s100 ERR4903912.clean.fastq 1399297 > downsampled/ERR4903912_downsampled.fastq


#These are then used as input for Kaiju runs
```
