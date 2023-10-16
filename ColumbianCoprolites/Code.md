### Get the raw data files:
```
wget https://www.be-md.ncbi.nlm.nih.gov/Traces/sra-reads-be/fastq?acc=SRR24300528
wget https://www.be-md.ncbi.nlm.nih.gov/Traces/sra-reads-be/fastq?acc=SRR24300527

mv fastq\?acc\=SRR24300528 Huecoid_coprolite_SRR24300528.fastq.gz
mv fastq\?acc\=SRR24300527 Saladoid_coprolite_SRR24300527.fastq.gz
```

### Run "pathopipe"
I used this pipeline: 
https://github.com/martinsikora/pathopipe

With all NCBI cp and mt genomes as targets. 
