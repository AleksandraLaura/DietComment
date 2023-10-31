#### This is all of the code used to make the krona plots:
```
#Make a new directory and link to all of the .kaiju.summarized outputs
mkdir krona
cd krona

ln -s ../*/kaiju_output/*.kaiju.summarized .

#Prep the files
ls *.kaiju.summarized > sample_list.txt
sed -i 's/\.kaiju\.summarized//g' sample_list.txt

#NuclearGenomes = SpeciesName (or any unique identifier) TAB Taxid
#NuclearCounts = Taxid TAB Counts

while read -r SAMPLE; do awk -F'\t' '{print $3 "\t" $2}' "${SAMPLE}.kaiju.summarized" > "${SAMPLE}.NuclearGenomes.txt"; done < sample_list.txt

while read -r SAMPLE; do awk -F'\t' '{print $2 "\t" $4}' "${SAMPLE}.kaiju.summarized" > "${SAMPLE}.NuclearCounts.txt"; done < sample_list.txt

#Make the fake fasta file
while read -r SAMPLE; do cut -f 1 ${SAMPLE}.NuclearGenomes.txt | while read line; do echo '>'$line; echo ACGT; done > ${SAMPLE}.Nuclear.fasta; done < sample_list.txt


#get kraken report
#load (or install) centrifuge


SAMPLE_LIST=sample_list.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)

centrifuge-build --conversion-table ${SAMPLE}.NuclearGenomes.txt --taxonomy-tree /path/to/nodes.dmp --name-table /path/to/names.dmp
${SAMPLE}.Nuclear.fasta ${SAMPLE}
centrifuge-kreport -x ${SAMPLE} --is-count-table ${SAMPLE}.NuclearCounts.txt > ${SAMPLE}.kreport.txt


```
