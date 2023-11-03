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
#Replace any spaces with "_"
while read -r SAMPLE; do sed -i 's/ /_/g' ${SAMPLE}.NuclearGenomes.txt; done < sample_list.txt

while read -r SAMPLE; do awk -F'\t' '{print $2 "\t" $4}' "${SAMPLE}.kaiju.summarized" > "${SAMPLE}.NuclearCounts.txt"; done < sample_list.txt

#Make the fake fasta file
while read -r SAMPLE; do cut -f 1 ${SAMPLE}.NuclearGenomes.txt | while read line; do echo '>'$line; echo ACGT; done > ${SAMPLE}.Nuclear.fasta; done < sample_list.txt


#Get kraken report
#first load (or install) centrifuge
SAMPLE_LIST=sample_list.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)

centrifuge-build --conversion-table ${SAMPLE}.NuclearGenomes.txt --taxonomy-tree /path/to/nodes.dmp --name-table /path/to/names.dmp ${SAMPLE}.Nuclear.fasta ${SAMPLE}
centrifuge-kreport -x ${SAMPLE} --is-count-table ${SAMPLE}.NuclearCounts.txt > ${SAMPLE}.kreport.txt

#Load the krona module
while read -r SAMPLE; do /path/to/apps/bin/kreport2krona.py -r ${SAMPLE}.kreport.txt -o ${SAMPLE}.krona.txt; done < sample_list.txt
while read -r SAMPLE; do ktImportText ${SAMPLE}.krona.txt -o ${SAMPLE}.krona.html; done < sample_list.txt
```
#### Doughnut plot
```
#Exctract all of the plant assignments
grep "p__Streptophyta" SRR24300527.krona.txt > SRR24300527_plant.krona.txt
grep "p__Streptophyta" SRR24300528.krona.txt > SRR24300528_plant.krona.txt

#Edit the files in excel so:
1. Filter away eveything with count 0 (0 in the first column)
2. If it's a species assignment keep the name and delete (s__) if anything else then type "other".
3. If the taxon is not deemed as "edible" then change the species name to "other" - we only report edibles in the plot to compare to the publication
4. Summarise the "others" (sum the count)
5. Add the Sample name column
6. Replace "_" with space

The final file "edible_PR_plant.krona.txt" can be found in this repository. 


#In R:
if(!require(devtools)) install.packages("devtools")
devtools::install_github("cardiomoon/moonBook")
devtools::install_github("cardiomoon/webr")

require(ggplot2)
require(moonBook)
require(webr)

library(readr)
eadibles_PR<-readr::read_tsv("Results/kaiju/edible_PR_plant.krona.txt")

#Edit this to make it nicer but principle the same.
PieDonut(eadibles_PR,aes(pies=sample,donuts=species,count=count))
```
