1. Code to download the data from Reynoso-García et al. (https://www.ncbi.nlm.nih.gov/sra?linkname=bioproject_sra_all&from_uid=961747)
```
#load or install sratoolkit
fasterq-dump SRR24300527
fasterq-dump SRR24300528
```


2. Code to download the Hallstatt data (https://www.ebi.ac.uk/ena/browser/view/PRJEB44507)
```
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/005/ERR5766175/ERR5766175_1.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/002/ERR5766182/ERR5766182_2.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/001/ERR5766181/ERR5766181_2.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/003/ERR5766183/ERR5766183_2.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/008/ERR5766178/ERR5766178_2.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/009/ERR5766179/ERR5766179_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/001/ERR5766171/ERR5766171_1.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/009/ERR5766179/ERR5766179_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/009/ERR5766169/ERR5766169_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/007/ERR5766167/ERR5766167_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/008/ERR5766168/ERR5766168_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/002/ERR5766172/ERR5766172_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/003/ERR5766173/ERR5766173_1.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/007/ERR5766177/ERR5766177_1.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/008/ERR5766178/ERR5766178_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/006/ERR5766166/ERR5766166_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/004/ERR5766174/ERR5766174_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/005/ERR5766165/ERR5766165_2.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/000/ERR5766180/ERR5766180_2.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/006/ERR5766176/ERR5766176_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/003/ERR5766173/ERR5766173_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/006/ERR5766166/ERR5766166_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/005/ERR5766165/ERR5766165_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/000/ERR5766170/ERR5766170_1.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/000/ERR5766180/ERR5766180_1.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/007/ERR5766177/ERR5766177_2.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/001/ERR5766181/ERR5766181_1.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/006/ERR5766176/ERR5766176_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/005/ERR5766175/ERR5766175_2.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/002/ERR5766182/ERR5766182_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/000/ERR5766170/ERR5766170_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/004/ERR5766174/ERR5766174_2.fastq.gz
# wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/003/ERR5766183/ERR5766183_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/009/ERR5766169/ERR5766169_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/007/ERR5766167/ERR5766167_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/001/ERR5766171/ERR5766171_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/002/ERR5766172/ERR5766172_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR576/008/ERR5766168/ERR5766168_1.fastq.gz
```

3. Code to download the Neanderthal data (https://www.ebi.ac.uk/ena/browser/view/PRJEB41665)
```
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/005/ERR4903915/ERR4903915.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/000/ERR4903910/ERR4903910.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/007/ERR4903917/ERR4903917.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/008/ERR4903918/ERR4903918.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/007/ERR4903907/ERR4903907.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/009/ERR4903909/ERR4903909.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/003/ERR4903913/ERR4903913.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/001/ERR4903911/ERR4903911.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/008/ERR4903908/ERR4903908.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/006/ERR4903916/ERR4903916.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/009/ERR4903919/ERR4903919.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/006/ERR4903906/ERR4903906.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/002/ERR4903912/ERR4903912.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR490/004/ERR4903914/ERR4903914.fastq.gz
```

4. Code to download the ötzi data (https://www.ebi.ac.uk/ena/browser/view/PRJEB11511)
```
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/008/ERR1094788/ERR1094788_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/002/ERR1094812/ERR1094812_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/005/ERR1094795/ERR1094795_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/000/ERR1094810/ERR1094810_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/006/ERR1094786/ERR1094786_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094807/ERR1094807_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/003/ERR1094803/ERR1094803_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/008/ERR1094778/ERR1094778_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/005/ERR1094805/ERR1094805_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/003/ERR1094793/ERR1094793_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/006/ERR1094816/ERR1094816_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/001/ERR1094811/ERR1094811_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/009/ERR1094799/ERR1094799_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/004/ERR1094794/ERR1094794_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/002/ERR1094792/ERR1094792_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/002/ERR1094782/ERR1094782_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/009/ERR1094809/ERR1094809_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094797/ERR1094797_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/004/ERR1094814/ERR1094814_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/008/ERR1094818/ERR1094818_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094777/ERR1094777_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/000/ERR1094780/ERR1094780_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/000/ERR1094790/ERR1094790_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/000/ERR1094780/ERR1094780_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/009/ERR1094779/ERR1094779_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/004/ERR1094814/ERR1094814_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/004/ERR1094804/ERR1094804_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/006/ERR1094816/ERR1094816_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/008/ERR1094788/ERR1094788_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/004/ERR1094784/ERR1094784_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/006/ERR1094796/ERR1094796_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/008/ERR1094798/ERR1094798_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/000/ERR1094800/ERR1094800_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/002/ERR1094802/ERR1094802_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/006/ERR1094786/ERR1094786_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/002/ERR1094812/ERR1094812_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/004/ERR1094784/ERR1094784_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/002/ERR1094802/ERR1094802_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/008/ERR1094818/ERR1094818_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/001/ERR1094791/ERR1094791_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/006/ERR1094806/ERR1094806_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/002/ERR1094782/ERR1094782_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/000/ERR1094800/ERR1094800_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/008/ERR1094808/ERR1094808_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/004/ERR1094794/ERR1094794_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/006/ERR1094806/ERR1094806_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094777/ERR1094777_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/001/ERR1094811/ERR1094811_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094787/ERR1094787_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/003/ERR1094813/ERR1094813_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/006/ERR1094796/ERR1094796_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/009/ERR1094779/ERR1094779_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/004/ERR1094804/ERR1094804_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/002/ERR1094792/ERR1094792_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/008/ERR1094808/ERR1094808_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/009/ERR1094789/ERR1094789_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/003/ERR1094793/ERR1094793_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/008/ERR1094798/ERR1094798_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/000/ERR1094810/ERR1094810_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/001/ERR1094781/ERR1094781_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/001/ERR1094791/ERR1094791_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094817/ERR1094817_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/005/ERR1094815/ERR1094815_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094797/ERR1094797_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/005/ERR1094815/ERR1094815_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/003/ERR1094803/ERR1094803_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/009/ERR1094819/ERR1094819_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/008/ERR1094778/ERR1094778_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/005/ERR1094805/ERR1094805_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/009/ERR1094799/ERR1094799_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/005/ERR1094795/ERR1094795_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094787/ERR1094787_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/003/ERR1094783/ERR1094783_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/005/ERR1094785/ERR1094785_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/003/ERR1094813/ERR1094813_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/001/ERR1094801/ERR1094801_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/000/ERR1094790/ERR1094790_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/009/ERR1094819/ERR1094819_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094807/ERR1094807_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/005/ERR1094785/ERR1094785_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/007/ERR1094817/ERR1094817_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/009/ERR1094789/ERR1094789_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/001/ERR1094801/ERR1094801_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/001/ERR1094781/ERR1094781_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/003/ERR1094783/ERR1094783_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR109/009/ERR1094809/ERR1094809_2.fastq.gz
```
