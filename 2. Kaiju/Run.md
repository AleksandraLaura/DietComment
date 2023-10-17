# Taxonomic assignment 
##### (OBS: here Kaiju (v1.9.2) VS Kaiju (v1.5.0) used in Reynoso-García et al.)
##### (in the future, add the '-v' option for easier output analysis.)

### Actuall run:
```
#Edit the SAMPLE_LIST to fit the data being processed. 
SAMPLE_LIST=hallstatt_names.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)

kaiju -t nodes.dmp -f plant.fmi -i ${SAMPLE}_1_val_1.fq.gz -j ${SAMPLE}_2_val_2.fq.gz -o output/${SAMPLE}_metawrap.out -a greedy -E 0.05 -z 32
```

### Post-processing of the output: 
##### See here for more options: https://github.com/bioinformatics-centre/kaiju#output-format 

#### Get only the classified:
```
for line in $(cat ../samplelist.txt); do grep -v "U" ${line}.combined.out > ${line}.classified.out; done
```

#### Add taxon names:
```
for line in $(cat ../samplelist.txt); do kaiju-addTaxonNames -t ../plants/nodes.dmp -n ../plants/names.dmp -i ${line}.classified.out -o ${line}.names.out; done
```
