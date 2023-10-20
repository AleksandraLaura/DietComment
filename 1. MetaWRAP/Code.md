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
#Replace samplelist.txt with any other dataset and run it in the same manner.
SAMPLE_LIST=samplelist.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)

#Note that adapters were already removed from the neanderthal samples therefore the option "--skip-trimming" was added and the same file was provided for both option "-1" and "-2"
metaWRAP read_qc -1 raw_fastq/${SAMPLE}_1.fastq.gz -2 raw_fastq/${SAMPLE}_2.fastq.gz -o metawrap_output/$SAMPLE -t 5
```

##Run BMTagger seperatly for the Neanderthal data (based on the [source code](https://github.com/bxlab/metaWRAP/blob/master/bin/metawrap-modules/read_qc.sh))
```
SAMPLE_LIST=neanderthal_names.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)

/apps/conda/metawrap-mg-1.3.2/bin/bmtagger.sh -b /path/to/your/index/BMTAGGER_INDEX/hg38.bitmask -x /path/to/your/index/BMTAGGER_INDEX/hg38.srprism -T metawrap_output/ -q 1 -1 ${SAMPLE}.fastq -o metawrap_output/${SAMPLE}.bmtagger.list

/apps/conda/metawrap-mg-1.3.2/bin/metawrap-scripts/skip_human_reads.py metawrap_output/${SAMPLE}.bmtagger.list raw_fastq/${SAMPLE}.fastq > metawrap_output/${SAMPLE}.clean.fastq

rm metawrap_output/${SAMPLE}.bmtagger.list

```
