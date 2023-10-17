1. Code to download the data from Reynoso-García et al. (https://www.ncbi.nlm.nih.gov/sra?linkname=bioproject_sra_all&from_uid=961747)
```
#load or install sratoolkit
fasterq-dump SRR24300527
fasterq-dump SRR24300528
```


2. Code to download the Hallstatt data ((https://www.ebi.ac.uk/ena/browser/view/PRJEB44507))
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

3. Code to download the Neanderthal data
```
```

4. Code to download the ötzi data
```
```
