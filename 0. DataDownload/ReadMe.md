1. Code to download the Puerto Rican data (https://www.ncbi.nlm.nih.gov/sra?linkname=bioproject_sra_all&from_uid=961747)
```
#load or install sratoolkit
fasterq-dump SRR24300527
fasterq-dump SRR24300528
```

2. Code to download the Neanderthal data (https://www.ebi.ac.uk/ena/browser/view/PRJEB41665) \
Only downloading the samples which reported [presence of human mtDNA](https://www.nature.com/articles/s42003-021-01689-y/figures/2 ) though at least one method: 
```
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/000/ERR4903910/ERR4903910.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/008/ERR4903918/ERR4903918.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/007/ERR4903907/ERR4903907.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/009/ERR4903909/ERR4903909.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/001/ERR4903911/ERR4903911.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/006/ERR4903906/ERR4903906.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/002/ERR4903912/ERR4903912.fastq.gz
```

3. Code to download the ötzi data\
   3.1 Go to AncientMetagenomeDir [(*Ancient metagenome - host associated: libraries*)](https://raw.githubusercontent.com/SPAAM-community/AncientMetagenomeDir/master/ancientmetagenome-hostassociated/libraries/ancientmetagenome-hostassociated_libraries.tsv)\
   3.2 Find all samples with "Iceman" included in the sample_name.\
   3.3 Pick one dataset from each reported sample (fourth row). \
   3.4 Get all the links and download likewise:
```
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094787/ERR1094787_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094787/ERR1094787_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/009/ERR1094779/ERR1094779_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/009/ERR1094779/ERR1094779_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/002/ERR1094782/ERR1094782_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/002/ERR1094782/ERR1094782_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/000/ERR1094780/ERR1094780_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/000/ERR1094780/ERR1094780_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094777/ERR1094777_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094777/ERR1094777_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/004/ERR1094784/ERR1094784_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/004/ERR1094784/ERR1094784_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/003/ERR1094793/ERR1094793_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/003/ERR1094793/ERR1094793_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/004/ERR1094794/ERR1094794_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/004/ERR1094794/ERR1094794_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/008/ERR1094788/ERR1094788_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/008/ERR1094788/ERR1094788_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/001/ERR1094791/ERR1094791_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/001/ERR1094791/ERR1094791_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR467/003/ERR4670283/ERR4670283_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR467/003/ERR4670283/ERR4670283_2.fastq.gz
```
