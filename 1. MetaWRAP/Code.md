# metaWrap (1.3.2)

## Make index to remove human sequences\
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
#Replace hallstatt_names.txt with any other dataset and run it in the same manner.
SAMPLE_LIST=hallstatt_names.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)

metaWRAP read_qc -1 raw_fastq/${SAMPLE}_1.fastq.gz -2 raw_fastq/${SAMPLE}_2.fastq.gz -o metawrap_output/$SAMPLE -t 5
```
