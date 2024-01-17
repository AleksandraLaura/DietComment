## Verification of reads that mapped to the ID'ed taxa in Reynoso-García et al.
#### Extract the reads
```
grep 'Zea\|Ipomoea\|Capsicum\|Arachis\|Carica\|Solanum\|Gossypium\|Nicotiana' SRR24300527.names.out >> targets.out
grep 'Zea\|Ipomoea\|Capsicum\|Arachis\|Carica\|Solanum\|Gossypium\|Nicotiana' SRR24300528.names.out >> targets.out
cut -f 2 targets.out > target_reads.txt

seqtk subseq metawrap_output/SRR24300527/final_pure_reads_1.fastq target_reads.txt >> KaijuTargets_27.R1.fastq
seqtk subseq metawrap_output/SRR24300527/final_pure_reads_2.fastq target_reads.txt >> KaijuTargets_27.R2.fastq
seqtk subseq metawrap_output/SRR24300528/final_pure_reads_1.fastq target_reads.txt >> KaijuTargets_28.R1.fastq
seqtk subseq metawrap_output/SRR24300528/final_pure_reads_2.fastq target_reads.txt >> KaijuTargets_28.R2.fastq
```

#### Collapse the reads
```
AdapterRemoval --file1 KaijuTargets_27.R1.fastq --file2 KaijuTargets_27.R2.fastq --basename KaijuTargets --collapse
AdapterRemoval --file1 KaijuTargets_28.R1.fastq --file2 KaijuTargets_28.R2.fastq --basename KaijuTargets --collapse
```

#### We then BLASTed the collapsed reads assigned to any of the reported species by Kaiju. The results can be found [here](https://github.com/AleksandraLaura/DietComment/blob/main/S3_Table.xlsx)


## Read length distribution of ALL of the collapsed reads from Reynoso-García et al.
#### Collaps the reads
```
AdapterRemoval --file1 SRR24300527_1.fastq --file2 SRR24300527_2.fastq --basename SRR24300527 --collapse
AdapterRemoval --file1 SRR24300528_1.fastq --file2 SRR24300528_2.fastq --basename SRR24300528 --collapse

```

#### Read length distribution 
```
bioawk -c fastx '{print length($seq)}' SRR24300527.collapsed | sort -n | uniq -c > 27_read_length_dist.txt
bioawk -c fastx '{print length($seq)}' SRR24300528.collapsed | sort -n | uniq -c > 28_read_length_dist.txt

#IN "R":
# Read the output from the command into R
output_27 <- read.table("27_read_length_dist.txt", header=FALSE)
output_28 <- read.table("28_read_length_dist.txt", header=FALSE)

# Set the column names
colnames(output_27) <- c("Count", "Read_Length")
colnames(output_28) <- c("Count", "Read_Length")

# Convert Read_Length to numeric
output_27$Read_Length <- as.numeric(as.character(output_27$Read_Length))
output_28$Read_Length <- as.numeric(as.character(output_28$Read_Length))

# Add a new column with the source file information
output_27 <- output_27 %>%
  mutate(Source = "SRR24300527 (Saladoid)")

# Add a new column with the source file information
output_28 <- output_28 %>%
  mutate(Source = "SRR24300528 (Huecoid)")

# Combine the two data frames
combined_data <- bind_rows(output_27, output_28)

pdf(file = "lenght_collapsed.pdf",   # The directory you want to save the file in
    width = 8, # The width of the plot in inches
    height = 5) # The height of the plot in inches

ggplot(combined_data, aes(x = Read_Length, group = Source, weight = Count)) +
  geom_density(aes(fill = Source), alpha = 0.8) +
  labs(title = " ",
       x = "Mean fragment length (bp)",
       y = "Density") +
  scale_fill_manual(values = c("#33ccd0", "#f9918a")) +
  theme_minimal()


dev.off()

```

#### Read length distribtuion of the reads assigned to the ID'ed taxa Reynoso-García et al. can be found [here](https://github.com/AleksandraLaura/DietComment/blob/main/2.%20Kaiju/lenght_collapsed.pdf)
