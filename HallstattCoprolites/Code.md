# Download the raw data files (https://www.ebi.ac.uk/ena/browser/view/PRJEB44507):
```
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/005/ERR5766175/ERR5766175_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/002/ERR5766182/ERR5766182_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/001/ERR5766181/ERR5766181_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/003/ERR5766183/ERR5766183_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/008/ERR5766178/ERR5766178_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/009/ERR5766179/ERR5766179_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/001/ERR5766171/ERR5766171_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/009/ERR5766179/ERR5766179_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/009/ERR5766169/ERR5766169_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/007/ERR5766167/ERR5766167_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/008/ERR5766168/ERR5766168_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/002/ERR5766172/ERR5766172_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/003/ERR5766173/ERR5766173_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/007/ERR5766177/ERR5766177_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/008/ERR5766178/ERR5766178_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/006/ERR5766166/ERR5766166_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/004/ERR5766174/ERR5766174_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/005/ERR5766165/ERR5766165_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/000/ERR5766180/ERR5766180_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/006/ERR5766176/ERR5766176_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/003/ERR5766173/ERR5766173_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/006/ERR5766166/ERR5766166_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/005/ERR5766165/ERR5766165_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/000/ERR5766170/ERR5766170_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/000/ERR5766180/ERR5766180_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/007/ERR5766177/ERR5766177_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/001/ERR5766181/ERR5766181_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/006/ERR5766176/ERR5766176_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/005/ERR5766175/ERR5766175_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/002/ERR5766182/ERR5766182_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/000/ERR5766170/ERR5766170_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/004/ERR5766174/ERR5766174_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/003/ERR5766183/ERR5766183_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/009/ERR5766169/ERR5766169_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/007/ERR5766167/ERR5766167_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/001/ERR5766171/ERR5766171_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/002/ERR5766172/ERR5766172_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/008/ERR5766168/ERR5766168_1.fastq.gz
```

# metaWrap (1.3.2)

## Make index to remove human sequences (as followed here: https://github.com/bxlab/metaWRAP/blob/master/installation/database_installation.md#making-host-genome-index-for-bmtagger):
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
SAMPLE_LIST=hallstatt_names.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)

metaWRAP read_qc -1 raw_fastq/${SAMPLE}_1.fastq.gz -2 raw_fastq/${SAMPLE}_2.fastq.gz -o metawrap_output/$SAMPLE -t 5
```

# Database creation for Kaiju:

## nr_euk
Automatic download link with the database from https://bioinformatics-centre.github.io/kaiju/downloads.html:
- https://kaiju-idx.s3.eu-central-1.amazonaws.com/2023/kaiju_db_nr_euk_2023-05-10.tgz

## plant taxa mentioned in Reynoso-García et al.

#### Download fasta file (and accession list):
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

## Taxonomic assignment (OBS: here Kaiju (v1.9.2) VS Kaiju (v1.5.0) used in Reynoso-García et al.)
#### First database (nr_euk)
```
kaiju -t nodes.dmp -f kaiju_db_nr_euk.fmi -i sample_post_metawrap_1.fastq -j sample_post_metawrap_2.fastq  -o sample.out −a greedy −E 0.05 -z 32
```

#### Second database (custom plants)
```
kaiju -t nodes.dmp -f plant.fmi -i sample_post_metawrap_1.fastq -j sample_post_metawrap_2.fastq  -o sample.out -a greedy -E 0.05 -z 32
```
### Post-processing: 
#### See here for more options: https://github.com/bioinformatics-centre/kaiju#output-format 

#### All of the output files need to be sorted to be merged:
```
for line in $(cat ../samplelist.txt); do sort -k2,2 ${line}.names.out > ${line}.sort.out; done
```

#### Now Merge the results from the two databases:
```
for line in $(cat ../samplelist.txt); do kaiju-mergeOutputs -i ../output/${line}.sort.out -j ../plants/output/${line}.sort.out -o ${line}.combined.out -t ../plants/nodes.dmp -v; done
```

#### Get only the classified:
```
for line in $(cat ../samplelist.txt); do grep -v "U" ${line}.combined.out > ${line}.classified.out; done
```

#### Add taxon names:
```
for line in $(cat ../samplelist.txt); do kaiju-addTaxonNames -t ../plants/nodes.dmp -n ../plants/names.dmp -i ${line}.classified.out -o ${line}.names.out; done
```
