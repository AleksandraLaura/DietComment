#### This is all of the code showing how to plot the barplot showing all of the reported taxa hits:

To get the input [targets_species.txt](https://raw.githubusercontent.com/AleksandraLaura/DietComment/main/2.%20Kaiju/targets_species.txt) and [targets_genera.txt](https://raw.githubusercontent.com/AleksandraLaura/DietComment/main/2.%20Kaiju/targets_genera.txt) files, I filter the [summarized Kaiju output file](https://github.com/AleksandraLaura/DietComment/blob/main/S2_Table.xlsx) only for the reported species and genera from [Reynoso-García et al.](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0292077). And seperate the two Puerto Rican files into their own "Dataset" category just like in the publication.

Here is the R code:
```
library(ggplot2)
library(ggtext)
library(tidyverse)
library(RColorBrewer)

barplot_ID_species<-readr::read_tsv("Results/kaiju/targets_species.txt")
barplot_ID_genera<-readr::read_tsv("Results/kaiju/targets_genera.txt")


# A function factory for getting integer y-axis values.
integer_breaks <- function(n = 5, ...) {
  fxn <- function(x) {
    breaks <- floor(pretty(x, n, ...))
    names(breaks) <- attr(breaks, "labels")
    breaks
  }
  return(fxn)
}

#To get the axis in order
level_order <- c('Huecoid', 'Saladoid', 'Neanderthal', 'Ötzi', 'Hallstatt') 

#Make and save the plots:

pdf(file = "barplot_species.pdf",   # The directory you want to save the file in
    width = 10, # The width of the plot in inches
    height = 6) # The height of the plot in inches

ggplot(barplot_ID_species, aes(x = factor(Dataset, level = level_order), y = nReads)) + 
  geom_bar(aes(fill=Species), stat = "identity", position=position_dodge2(preserve = "single"), alpha = 0.9, col = "grey") +
  scale_y_continuous(breaks = integer_breaks()) +
  theme_minimal() +
  xlab("") +
  ylab("number of reads") +
  ggtitle("Species level Hallstatt") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

dev.off()


pdf(file = "barplot_genus.pdf",   # The directory you want to save the file in
    width = 10, # The width of the plot in inches
    height = 6) # The height of the plot in inches

ggplot(barplot_ID_genera, aes(x = factor(Dataset, level = level_order), y = nReads)) + 
  geom_bar(aes(fill=Species), stat = "identity", position=position_dodge2(preserve = "single"), alpha = 0.9, col = "grey") +
  scale_y_continuous(breaks = integer_breaks()) +
  theme_minimal() +
  xlab("") +
  ylab("number of reads") +
  ggtitle("Genus level Hallstatt") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

dev.off()
```

#### Final Figure 2 with the barplot can be found [here](https://github.com/AleksandraLaura/DietComment/blob/main/2.%20Kaiju/Figure%202.pdf)
