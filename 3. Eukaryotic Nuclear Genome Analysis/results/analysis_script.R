# Filename: analysis_script.R
library(tidyverse)
library(ggplot2)

# Check if the correct number of command line arguments is provided
if (length(commandArgs(trailingOnly = TRUE)) != 1) {
  cat("Usage: Rscript analysis_script.R <input_csv_file>\n")
  quit(status = 1)
}

# Get the input file path from the command line
input_file <- commandArgs(trailingOnly = TRUE)[1]

# import data
df <- read_csv(input_file)

# subsetting the table for Eukaryotes using grepl and filter for taxonomic classification at genus level with 10 reads or more classified
dt <- df %>% filter(N_reads >= 10, grepl("Eukaryota", tax_path), grepl("\\bgenus\\b", tax_rank))

# Plot taxa and their amount of Damage and the significance with size = number of reads for all 4 files
pdf(file = "Damage_significance_Eukatota.pdf", width = 6, height = 5)  
ggplot() +
  geom_text(data = dt, aes(x = MAP_damage, y = MAP_significance, label = tax_name), size = 3, vjust = -1, hjust = 0) +
  geom_point(data = dt, aes(x = MAP_damage, y = MAP_significance, fill = "grey", size = N_reads), alpha = 0.5) +
  ggtitle("") +
  labs(col = "depths", fill = "Taxa") +
  facet_wrap(~sample) +
  theme_test()
dev.off()

# Plot mean readlength distribution for all 4 files as a density plot
pdf(file = "density_meanlength.pdf", width = 5, height = 3)
ggplot(dt, aes(x = mean_L, fill = sample)) +
  geom_density(alpha = 0.5) +
  scale_fill_viridis_d(option = "G") +
  xlim(30, 450) + ylim(0, 0.011) + theme_test()
dev.off()

# Subsetting the dataframe and keeping only the 95% similarity threshold profiles
# subset_data1 <- subset(dt, !grepl("_92", sample))

# Plot taxa and their amount of Damage and the significance with size = number of reads for 95 similarity files
pdf(file = "Damage_significance_Eukatota95sim.pdf", width = 6, height = 5)  
ggplot() +
  geom_text(data = subset_data1, aes(x = MAP_damage, y = MAP_significance, label = tax_name), size = 3, vjust = -1, hjust = 0) +
  geom_point(data = subset_data1, aes(x = MAP_damage, y = MAP_significance, colour = sample, size = N_reads), alpha = 0.8) +
  scale_colour_manual(values = c("#92c5de", "darkgrey"), name = "Sample") +  
  ggtitle("") +
  labs(col = "depths", fill = "Taxa") +
  theme_test()
dev.off()

# Plot mean readlength distribution for the 95 similarity files as a density plot
pdf(file = "density_meanlength.pdf", width = 5, height = 3)
ggplot(subset_data1, aes(x = mean_L, fill = sample)) +
  geom_density(alpha = 0.8) +
  scale_fill_manual(values = c("#92c5de", "darkgrey"), name = "Sample") +
  xlim(30, 450) + ylim(0, 0.011) + theme_test()
dev.off()

# Save table with read counts per taxa and sample.
write.csv(dt, file = "eukaryote_table.csv")
