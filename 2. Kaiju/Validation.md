#### Extract the reads that mapped to the target sequences
```
grep 'Zea\|Ipomoea\|Capsicum\|Arachis\|Carica\|Solanum\|Gossypium\|Nicotiana' SRR24300527.names.out >> targets.out
grep 'Zea\|Ipomoea\|Capsicum\|Arachis\|Carica\|Solanum\|Gossypium\|Nicotiana' SRR24300528.names.out >> targets.out
cut -f 2 targets.out > target_reads.txt

seqtk subseq metawrap_output/SRR24300527/final_pure_reads_1.fastq target_reads.txt >> target_seqs.fastq
seqtk subseq metawrap_output/SRR24300527/final_pure_reads_2.fastq target_reads.txt >> target_seqs.fastq
seqtk subseq metawrap_output/SRR24300528/final_pure_reads_1.fastq target_reads.txt >> target_seqs.fastq
seqtk subseq metawrap_output/SRR24300528/final_pure_reads_2.fastq target_reads.txt >> target_seqs.fastq
```
