if (!require("forcats")) install.packages('forcats')
library('forcats')
if (!require("ggplot2")) install.packages("ggplot2")
library('ggplot2')
if (!require("ggstance")) install.packages("ggdtance")
library('ggstance')
if (!require("plyr")) install.packages("plyr")
library('plyr')
if (!require("dplyr")) install.packages("dplyr")
library('dplyr')


BiocManager::install('DOSE')
BiocManager::install('clusterProfiler')

if (!require("DOSE")) install.packages("DOSE")
library(DOSE)

if(!require("clusterProfiler")) install.packages("clusterProfiler")
library(clusterProfiler)

if (!require("enrichplot")) install.packages("enrichplot")
library(enrichplot)

#

split_complete <- arrange(complete, abs(nes)) %>% 
  group_by(sign(nes)) %>% 
  slice(1:30)

library('forcats')
library('ggplot2')
library('ggstance')
library('plyr')
library('dplyr')

ggplot(split_NES, aes(nes, fct_reorder(Description, nes), fill=pvalue), showCategory=10) + 
  geom_barh(stat='identity') + 
  scale_fill_continuous(low='red', high='blue', guide=guide_colorbar(reverse=TRUE)) + 
  theme_minimal() + ylab(NULL) + ggtitle("PTM-signature enrichment directionality", subtitle = "Normalized Enrichment Scores (NES) for UP & DOWN regulated phosphopeptides uniquely expressed in PI3Ki resistant tumors 
Log2fc > |0.58|; (resistant - control)") + xlab("NES")

