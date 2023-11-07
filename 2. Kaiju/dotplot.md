#### This is all of the code showing how to plot the dotplot showing all of the reported taxa hits:

To get the input [.txt](https://raw.githubusercontent.com/AleksandraLaura/CoproliteAnalysesCommentaryALP/main/2.%20Kaiju/targets_datasets.txt) file, I filter the [summarized Kaiju output file](https://github.com/AleksandraLaura/CoproliteAnalysesCommentaryALP/blob/main/2.%20Kaiju/all_kaiju_summarized.txt.gz) only for the reported species from [Reynoso-García et al.](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0292077).

Here is the R code:
```
library(ggplot2)
library(readr)

barplot_IDedtaxa<-readr::read_tsv("Results/kaiju/targets_datasets.txt")

#Code for the plot

```
