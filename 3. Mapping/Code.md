## This is the code used for mapping and validation of the Columbian samples against a plant database.
#### First combine the files from metaWRAP (by using reformat from BBmap suite) 
-> because metaWRAP already trimmed the reads and removed indexes.
```
reformat.sh in1=R1.fq.gz in2=R2.fq.gz out=interleaved.fq.gz
```

#### bowtie2 against the vanilla version of GTDB with archaea, bacteria, and viruses, plus organelles
```
bowtie2 --threads 24 -k 16 -x /path/to/db/Vanilla/gtdb-r202-organelles-viruses -U interleaved.fq.gz --no-unal --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min "L,0,-0.05" --very-sensitive --no-unal | samtools view -b -@ 24 -F 4 - | samtools sort -n -@ 24 -o bam - > mapping/output.bam
```

#### filterBAM
```
DB=/path/to/db/Vanilla/gtdb-r202-organelles-viruses
path=mapping/
filterBAM -t 20 \
 -p $SAMPLE \
 --read-length-freqs \
 -r $DB.len.map \
 -N \
 $path/output.bam

```

#### metaDMG
```
metaDMG compute metadmg_columbian_config.yaml
```
