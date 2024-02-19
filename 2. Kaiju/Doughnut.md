#### Doughnut plot 
The raw input file can be found in the S2 Table ([here](https://github.com/AleksandraLaura/DietComment/blob/main/S2_Table.xlsx)).

##### Edit the file in excel so:
1. Filter for Puerto Rican
2. Filter away everything that isn't a plant
3. Find the reported species and top two non-reported species
4. Summarize all other plant taxa into either "edible" or "non-edible"
5. Change the column names/order and add the "Culture" variable


The final file "PR_plant.txt" can be found in this repository ([here](https://github.com/AleksandraLaura/DietComment/blob/main/2.%20Kaiju/PR_plant.txt)). 


###### In R:
```
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

#### Final Figure 2 with the pie/donut plot can be found [here](https://github.com/AleksandraLaura/DietComment/blob/main/2.%20Kaiju/Figure%202.pdf)
