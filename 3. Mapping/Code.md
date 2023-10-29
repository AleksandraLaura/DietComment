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
SAMPLE_LIST=columbian_names.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)

DB=/path/to/db/Vanilla/gtdb-r202-organelles-viruses
path=mapping/

filterBAM -t 20 \
 --tmp-dir $TMP \
 -p $SAMPLE \
 --stats-filtered \
 --bam-filtered \
 --read-length-freqs \
 -r $DB.len.map \
 --min-read-count 10 \
 --min-expected-breadth-ratio 0.7 \
 --min-read-ani 90 \
 --sort-memory 1G \
 -N \
 --bam $path/${SAMPLE}.bam \
 --stats
```

#### metaDMG
```
metaDMG config --metaDMG-cpp /path/to/apps/bin/metaDMG-cpp --names /path/to/db/Vanilla/names.dmp --nodes /path/to/db/Vanilla/nodes.dmp --acc2tax /path/to/db/Vanilla/acc2taxid.map.gz --min-similarity-score 0.95 --max-similarity-score 1.0 --max-position 35 --forward-only --output-dir mapping/metadmg/ --parallel-samples 5 --bayesian --config-file metadmg_columbian_config.yaml --overwrite mapping/SRR24300527.filtered.bam mapping/SRR24300528.filtered.bam

metaDMG compute metadmg_columbian_config.yaml
```