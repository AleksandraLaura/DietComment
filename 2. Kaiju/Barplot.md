#### This is all of the code showing how to plot the barplot showing all of the reported taxa hits:

To get the input [.txt](https://raw.githubusercontent.com/AleksandraLaura/CoproliteAnalysesCommentaryALP/main/2.%20Kaiju/targets_datasets.txt) file, I filter the [summarized Kaiju output file](https://github.com/AleksandraLaura/CoproliteAnalysesCommentaryALP/blob/main/2.%20Kaiju/all_kaiju_summarized.txt.gz) only for the reported species from [Reynoso-García et al.](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0292077).

Here is the R code:
```
library(ggplot2)
library(readr)

barplot_IDedtaxa<-readr::read_tsv("Results/kaiju/targets_datasets.txt")

#Because I would like to show that we have different samples by seperating them by a white line yet still coloring in by Dataset and getting that legend I'm plotting the same barplot twice and just extracting the legend from the first one:
#To get the legend
ggplot(barplot_IDedtaxa, aes(x = Species, y = nReads, fill = Dataset)) + 
  geom_bar(stat = "identity") + 
  scale_fill_manual(values = c("darkcyan", "blue", "brown", "lightblue")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#The plot
ggplot(barplot_IDedtaxa, aes(x = Species, y = nReads, fill = Sample)) + 
  geom_bar(col = "white", stat = "identity") + 
  scale_fill_manual(breaks = c(barplot_IDedtaxa$Sample), 
                       values=c(replicate(5, "darkcyan"), replicate(6, "blue"), replicate(11, "lightblue"), "brown", "blue","brown", replicate(7, "blue"),replicate(4, "lightblue"), "brown","brown",replicate(6, "blue"), "lightblue","brown",replicate(3, "blue"),"lighblue","brown",replicate(4, "darkcyan"), replicate(4, "blue"), replicate(11, "lightblue"), "brown", replicate(3, "blue"), "lightblue","brown","lightblue","brown")) +
  ylab("number of reads") +
  xlab("") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

```
