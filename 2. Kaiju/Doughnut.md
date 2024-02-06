#### Doughnut plot 
The raw input files can be found [here (Saladoid)](https://raw.githubusercontent.com/AleksandraLaura/CoproliteAnalysesCommentaryALP/main/2.%20Kaiju/SRR24300527.krona.txt) and [here (Huecoid)](https://raw.githubusercontent.com/AleksandraLaura/CoproliteAnalysesCommentaryALP/main/2.%20Kaiju/SRR24300528.krona.txt).
```
#Edit the file in excel so:
1. Add the sample and Culture name column
3. Find the reported taxa and summarise them
4. For every taxon with 10 or less reads (or that is not reported on species level) - summarise them into "Other Streptophyta"
5. Add custom ordering in the donut plot by adding numbers in front of the lables

The final file "PR_plant.txt" can be found in this repository. 


#In R:
if(!require(devtools)) install.packages("devtools")
devtools::install_github("cardiomoon/moonBook")
devtools::install_github("cardiomoon/webr")

require(ggplot2)
require(moonBook)
require(webr)

library(readr)
plants_PR<-readr::read_tsv("Results/kaiju/PR_plant.txt")
PieDonut(plants_PR,aes(pies=Culture,donuts=species,count=count), pieLabelSize = 5, labelposition = 1, showRatioDonut = FALSE, showRatioThreshold = FALSE)
```
