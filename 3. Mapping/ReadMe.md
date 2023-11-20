## This is the code used for mapping and validation of the Puerto Rican samples against a plant database.

#### Adapter removal on the files from metaWRAP (to avoid removing human reads again)
```
AdapterRemoval --file1 ../metawrap_output/${SAMPLE}/final_pure_reads_1.fastq --file2 ../metawrap_output/${SAMPLE}/final_pure_reads_2.fastq --basename ${SAMPLE} --threads 8 --collapse

cat ${SAMPLE}.collapsed ${SAMPLE}.collapsed.truncated ${SAMPLE}.singleton.truncated ${SAMPLE}.pair1.truncated *.pair2.truncated > ${SAMPLE}.combined.fq
```

#### bowtie2 against the vanilla version of GTDB with archaea, bacteria, and viruses, plus organelles (we're using the files outputted by metaWRAP)
```
bowtie2 --threads 24 -k 16 -x /path/to/db/Vanilla/gtdb-r202-organelles-viruses -1 metawrap_output/${SAMPLE}/final_pure_reads_1.fastq -2 metawrap_output/${SAMPLE}/final_pure_reads_2.fastq  --no-unal --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min "L,0,-0.05" --very-sensitive --no-unal | samtools view -b -@ 24 -F 4 - | samtools sort -n -@ 24 -o bam - > mapping/output.bam
```

#### filterBAM
```
SAMPLE_LIST=pr_names.txt
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
metaDMG config --metaDMG-cpp /path/to/apps/bin/metaDMG-cpp --names /path/to/db/Vanilla/names.dmp --nodes /path/to/db/Vanilla/nodes.dmp --acc2tax /path/to/db/Vanilla/acc2taxid.map.gz --min-similarity-score 0.95 --max-similarity-score 1.0 --max-position 35 --output-dir mapping/metadmg/ --parallel-samples 1 --cores-per-sample 5 --custom-database --bayesian --config-file metadmg_pr_config.yaml --overwrite mapping/SRR24300527.filtered.bam mapping/SRR24300528.filtered.bam

metaDMG compute metadmg_pr_config.yaml
```

The metaDMG .pdf export of the results can be found [here](https://github.com/AleksandraLaura/CoproliteAnalysesCommentaryALP/blob/main/3.%20Mapping/metaDMG_results.pdf) and the raw results files [here](https://github.com/AleksandraLaura/CoproliteAnalysesCommentaryALP/tree/main/3.%20Mapping/results).


#### Plotting (in R)
```
library(readr)
library(ggplot2)
library(ggtext)
library(tidyverse)
library(RColorBrewer)
library(ggrepel)

metadmg<-read.csv("Results/pathopipe/metadmg_results.csv", row.names = NULL)
metadmg_species <- subset(metadmg, tax_rank == "species")
metadmg_species <- subset(metadmg_species, N_reads > 10)
metadmg_names <- metadmg_species %>% mutate(across('sample', str_replace, 'SRR24300527', 'Saladoid'))
metadmg_names <- metadmg_names %>% mutate(across('sample', str_replace, 'SRR24300528', 'Huecoid'))
metadmg_names$tax_name <- gsub("s__", "", metadmg_names$tax_name)

ggplot(metadmg_names, aes(x = significance, y = damage, col = sample)) + 
  geom_point(aes(size=N_reads)) + 
  geom_text_repel(data=subset(metadmg_names, damage > 0.08 | significance > 0.8), aes(significance,damage,label=tax_name), min.segment.length = 0, size=2) +
  scale_color_manual(values = c("#f9918a", "#33ccd0")) +
  theme_minimal() +
  scale_y_continuous(labels = scales::percent) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

