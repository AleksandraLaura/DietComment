#### This is all of the code showing how to plot the dotplot showing all of the reported taxa hits:

To get the input [.txt](https://raw.githubusercontent.com/AleksandraLaura/CoproliteAnalysesCommentaryALP/main/2.%20Kaiju/targets_datasets.txt) file, I filter the [summarized Kaiju output file](https://github.com/AleksandraLaura/CoproliteAnalysesCommentaryALP/blob/main/2.%20Kaiju/all_kaiju_summarized.txt.gz) only for the reported species from [Reynoso-García et al.](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0292077). And seperate the two Puerto Rican files into their own "Dataset" category just like in the publication.

Here is the R code:
```
library(ggplot2)
library(ggtext)
library(tidyverse)
library(RColorBrewer)

barplot_IDedtaxa<-readr::read_tsv("Results/kaiju/targets_datasets.txt")

#Calculate the mean number of reads pr. taxon for each dataset
IDed_taxa_mean <- barplot_IDedtaxa %>%
  group_by(Species, Dataset) %>%
  summarise(mean_nReads = mean(nReads, na.rm = TRUE))

#To get the axis in order
level_order <- c('Huecoid', 'Saladoid', 'Neanderthal', 'Ötzi') 

#Plot itself
ggplot(IDed_taxa_mean, aes(x = factor(Dataset, level = level_order), y = mean_nReads)) + 
  geom_bar(aes(fill=Species), stat = "identity", position = "dodge", alpha = 0.9) +
  scale_fill_brewer(palette="BrBG", 
                    "Species",
    breaks = unique(barplot_IDedtaxa$Species),
    labels = c(expression(italic("Zea mays")), expression(italic("Ipomoea batatas")), expression(italic("Capsicum annuum")), expression(italic("Arachis hypogaea")), expression(italic("Arachis duranensis")), expression(italic("Carica papaya")), expression(italic("Gossypium barbadense")), expression(italic("Nicotiana sylvestris")), expression(italic("Solanum lycopersicum")))) +
  theme_minimal() +
  xlab("") +
  ylab("number of reads") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```
