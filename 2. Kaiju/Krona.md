#### This is all of the code used to make the krona plots:
# (not used in the end)
```
#Make a new directory and link to all of the .kaiju.summarized outputs
mkdir krona
cd krona

ln -s ../*/kaiju_output/*.kaiju.summarized .

#Prep the files
ls *.kaiju.summarized > PR_sample_list.txt
sed -i 's/\.kaiju\.summarized//g' PR_sample_list.txt

#NuclearGenomes = SpeciesName (or any unique identifier) TAB Taxid
#NuclearCounts = Taxid TAB Counts

while read -r SAMPLE; do awk -F'\t' '{print $3 "\t" $2}' "${SAMPLE}.kaiju.summarized" > "${SAMPLE}.NuclearGenomes.txt"; done < sample_list.txt
#Replace any spaces with "_"
while read -r SAMPLE; do sed -i 's/ /_/g' ${SAMPLE}.NuclearGenomes.txt; done < sample_list.txt

while read -r SAMPLE; do awk -F'\t' '{print $2 "\t" $4}' "${SAMPLE}.kaiju.summarized" > "${SAMPLE}.NuclearCounts.txt"; done < sample_list.txt

#Make the fake fasta file
while read -r SAMPLE; do cut -f 1 ${SAMPLE}.NuclearGenomes.txt | while read line; do echo '>'$line; echo ACGT; done > ${SAMPLE}.Nuclear.fasta; done < sample_list.txt


#Get kraken report
#first load (or install) centrifuge
SAMPLE_LIST=PR_sample_list.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)

centrifuge-build --conversion-table ${SAMPLE}.NuclearGenomes.txt --taxonomy-tree /path/to/nodes.dmp --name-table /path/to/names.dmp ${SAMPLE}.Nuclear.fasta ${SAMPLE}
centrifuge-kreport -x ${SAMPLE} --is-count-table ${SAMPLE}.NuclearCounts.txt > ${SAMPLE}.kreport.txt

#Load the krona module
while read -r SAMPLE; do /path/to/apps/bin/kreport2krona.py -r ${SAMPLE}.kreport.txt -o ${SAMPLE}.krona.txt; done < sample_list.txt
while read -r SAMPLE; do ktImportText ${SAMPLE}.krona.txt -o ${SAMPLE}.krona.html; done < sample_list.txt
```
