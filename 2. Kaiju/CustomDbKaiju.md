# This is a note to help for custom database creation for Kaiju from protein sequences:\ Ultimatively not used in the workflow. 

#### Download fasta file (and accession list) - plant taxa mentioned in Reynoso-García et al.:
```
esearch -db protein -query '("Zea mays"[Organism] OR "Carica papaya"[Organism] OR "Arachis hypogaea"[Organism] OR "Arachis duranensis"[Organism] OR "Ipomoea batatas"[Organism] OR "Capsicum annuum"[Organism] OR "Nicotiana sylvestris"[Organism] OR "Solanum lycopersicum"[Organism] OR "Gossypium barbadense"[Organism]) AND plants[filter]' | efetch -format fasta > plant_prot.fasta
```

#### Additional changes to the fasta (make the header correspond to the accessions):
```
awk 'NR==FNR { replacements[NR] = $0; next } /^>/ { print ">" replacements[++counter]; next } { print }' plant_prot.seq plant_prot.fasta > plant_prot_accession.fasta
```

#### Now in R (Thank you for the help @jfy133):
```
library(taxonomizr)
prepareDatabase(types='prot')
kaiju_sequences_taxid <- read.csv("plant_prot.seq",header=FALSE)
taxaId<-accessionToTaxa(kaiju_sequences_taxid$V1,"nameNode.sqlite")
write.csv(taxaId,file="kaiju_sequences_taxId.txt",row.names=F)
```

#### Some taxID were NA (we want to fix those):
```
#Check how many
grep "NA" kaiju_sequences_taxId.txt | wc -l

#First delete the first line of kaiju_sequences_taxId.txt (artifact from R; this line is ‘x’). I did it manually.
#Then concatinate the filed with taxID and accession ID.
paste kaiju_sequences_taxId.txt plant_prot.seq > taxID_Acc_plant.txt

#Create a file with the seq_IDs to get rid of: 
awk '$1 == "NA" {print}' taxID_Acc_plant.txt | cut -f2 > NA_taxID_plant.seq

#Find the taxID for the missing ones:
cat NA_taxID_plant.seq | epost -db protein | esummary | xtract -pattern DocumentSummary -element Caption,TaxId > NA_taxID_taxID.seq

#See if all went well - if the two files have the same Accession names in there still):
diff <(awk '{print $1}' NA_taxID_taxID.seq) NA_taxID_plant.seq -y --suppress-common-lines

#Replace the NA’s from the first file with the taxID’s from the second file:
awk -F'\t' 'NR==FNR{a[$1]=$2;next} ($2 in a) {$1=a[$2]}1' NA_taxID_taxID.seq taxID_Acc_plant.txt > taxIDAcc_plant.txt

#See if all went well (we expect this to not output anything):
grep NA -w taxIDAcc_plant.txt

#Remove that one protein (1411165A:PDB=1PPO):
awk '{ if ((NR>1)&&($0~/^>/)) { printf("\n%s", $0); } else if (NR==1) { printf("%s", $0); } else { printf("\t%s", $0); } }' plant_prot_accession.fasta | grep -v 1411165A:PDB=1PPO - | tr "\t" "\n" > plant_prot_cleaned.fasta

grep -v "1411165A:PDB=1PPO" taxIDAcc_plant.txt > taxIDAccesion_plant_cleaned.txt

#And lastly fix a little upsi - the columns are expected to go the other way around:
awk '{print $2, $1}' taxIDAccesion_plant_cleaned.txt > plant_Acc2TaxID.txt
```

#### NOW I have the fasta file (plant_prot_cleaned.fasta) and one taxIDAccesion file (plant_Acc2TaxID.txt). Last step is to make the kaiju_sequences.faa file:
#### This might take a little while
```
awk 'FNR==NR {f2[$1]=$2;next} /^>/ { for (i in f2) { if (index(substr($1,2), i)) { print ">"f2[i]; next } } }1' plant_Acc2TaxID.txt plant_prot_cleaned.fasta > kaiju_sequences.faa
```

#### Make the actual databases
```
kaiju-mkbwt -n 32 -a ACDEFGHIKLMNPQRSTVWY -o /home/wmj412/data/wmj412.aleks/hallstatt_maize/kaiju_part/plants/plants kaiju_sequences.faa
kaiju-mkfmi /home/wmj412/data/wmj412.aleks/hallstatt_maize/kaiju_part/plants/plants
```
