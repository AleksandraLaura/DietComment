# Taxonomic assignment 
**OBS: here Kaiju (v1.9.2) VS Kaiju (v1.5.0) used in Reynoso-García et al.**\
**in the future, add the '-v' option for easier output analysis.**

### Actual run:
```
#Edit the SAMPLE_LIST to fit the data being processed. 
SAMPLE_LIST=samplelist.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)

kaiju -t nodes.dmp -f kaiju_db_nr_euk.fmi -i edit/this/path/${SAMPLE}/final_pure_reads_1.fastq -j edit/this/path/${SAMPLE}/final_pure_reads_2.fastq -o output/${SAMPLE}.out -a greedy -E 0.05 -z 32
```

### Post-processing of the output: 
##### See here for more options: https://github.com/bioinformatics-centre/kaiju#output-format 

#### Get only the classified:
```
for line in $(cat ../samplelist.txt); do grep -v "U" ${line}.out > ${line}.classified.out; done
```

#### Add taxon names:
```
for line in $(cat ../samplelist.txt); do kaiju-addTaxonNames -t ../nodes.dmp -n ../names.dmp -i ${line}.classified.out -o ${line}.names.out; done
```
