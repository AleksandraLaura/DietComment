1. Code to download the Puerto Rican data (https://www.ncbi.nlm.nih.gov/sra?linkname=bioproject_sra_all&from_uid=961747)
```
#load or install sratoolkit
fasterq-dump SRR24300527
fasterq-dump SRR24300528
```

2. Code to download the Neanderthal dataset (ES7) (https://www.ebi.ac.uk/ena/browser/view/PRJEB41665) \
Only picking one of the samples which reported [presence of human mtDNA](https://www.nature.com/articles/s42003-021-01689-y/figures/2 ) though at least one method: 
```
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/002/ERR4903912/ERR4903912.fastq.gz
```

3. Code to download the ötzi dataset (I1054)\
   3.1 Go to AncientMetagenomeDir [(*Ancient metagenome - host associated: libraries*)](https://raw.githubusercontent.com/SPAAM-community/AncientMetagenomeDir/master/ancientmetagenome-hostassociated/libraries/ancientmetagenome-hostassociated_libraries.tsv)\
   3.2 Find one sample with "Iceman" included in the sample_name.\
   3.4 Get the links and download likewise:
```
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094787/ERR1094787_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094787/ERR1094787_2.fastq.gz
```
