# Taxonomic assignment 
**OBS: here Kaiju (v1.9.2) VS Kaiju (v1.5.0) used in Reynoso-García et al.**\
**in the future, add the '-v' option for easier output analysis.**

### Actual run:

Puerto Rican & ötzi data:
``` 
SAMPLE_LIST=samplelist.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)

kaiju -t nodes.dmp -f kaiju_db_nr_euk.fmi -i /path/to/metaWRAP/output/${SAMPLE}/final_pure_reads_1.fastq -j /path/to/metaWRAP/output/${SAMPLE}/final_pure_reads_2.fastq -o output/${SAMPLE}.out -a greedy -E 0.05 -z 32
```

Neanderthal:
``` 
kaiju -t nodes.dmp -f kaiju_db_nr_euk.fmi -i /path/to/metaWRAP/output/ERR4903912_downsampled.fastq -o output/ERR4903912.out -a greedy -E 0.05 -z 32
```

### Post-processing of the output: 
##### See here for more options: https://github.com/bioinformatics-centre/kaiju#output-format 

#### Get only the classified:
```
for line in $(cat ../ALL_samplelist.txt); do grep -v "U" ${line}.out > ${line}.classified.out; done
```

#### Add taxon names:
```
for line in $(cat ../ALL_samplelist.txt); do kaiju-addTaxonNames -t ../nodes.dmp -n ../names.dmp -i ${line}.classified.out -o ${line}.names.out; done
```

#### Count number of reads assigned to each taxon.
```
for line in $(cat ../ALL_samplelist.txt); do awk -F'\t' '{split($2, arr, "."); print arr[1]"\t"$3"\t"$4}' ${line}.names.out | awk -F'\t' '{ count[$0]++ } END {for (row in count) { print row"\t"count[row] } }' > ${line}.kaiju.summarized; done

cat *.kaiju.summarized > combined.kaiju.summarized
```

__the resulting file, with an additionall column specifing the dataset can be found in this repository under the name [_all_kaiju_summarized.txt.gz_](https://github.com/AleksandraLaura/CoproliteAnalysesCommentaryALP/blob/main/2.%20Kaiju/all_kaiju_summarized.txt.gz)__
