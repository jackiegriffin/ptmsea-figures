
BiocManager::install('DOSE')
BiocManager::install('clusterProfiler')

if (!require("DOSE")) install.packages("DOSE")
library(DOSE)
if(!require("clusterProfiler")) install.packages("clusterProfiler")
library(clusterProfiler)
if (!require("enrichplot")) install.packages("enrichplot")
library(enrichplot)
if (!require("forcats")) install.packages('forcats')
library('forcats')
if (!require("ggplot2")) install.packages("ggplot2")
library('ggplot2')

if (!require("ggstance")) install.packages("ggstance")
library('ggstance')
if (!require("plyr")) install.packages("plyr")
library('plyr')
if (!require("dplyr")) install.packages("dplyr")
library('dplyr')
if (!require("viridis")) install.packages("viridis")
library("viridis")

NES<-read.csv("split_plot_upload.csv", header = TRUE, stringsAsFactors = FALSE)
split_NES <- arrange(NES, abs(nes)) %>% 
  group_by(sign(nes)) %>% 
  slice(1:30)

ggplot(split_NES, aes(nes, fct_reorder(Description, nes), fill=pvalue), showCategory=10) + 
  geom_barh(stat='identity') + 
  scale_fill_continuous(low='red', high='blue', guide=guide_colorbar(reverse=TRUE)) + 
  theme_minimal() + ylab(NULL) + ggtitle("PTM-signature enrichment directionality", subtitle = "Normalized Enrichment Scores (NES) for UP & DOWN regulated phosphopeptides uniquely expressed in PI3Ki resistant tumors 
Log2fc > |0.58|; (resistant - control)") + xlab("NES")



NES_filtered<-read.csv("split_plot_upload_filtered.csv", header = TRUE, stringsAsFactors = FALSE)
split_NES_filtered <- arrange(NES_filtered, abs(nes)) %>% 
  group_by(sign(nes)) %>% 
  slice(1:30)

ggplot(split_NES_filtered, aes(nes, fct_reorder(Description, nes), fill=pvalue), showCategory=10) + 
  geom_barh(stat='identity') + 
  scale_fill_continuous(low='red', high='blue', guide=guide_colorbar(reverse=TRUE)) + 
  theme_minimal() + ylab(NULL) + ggtitle("PTM-signature enrichment directionality", subtitle = "Normalized Enrichment Scores (NES) for UP & DOWN regulated phosphopeptides uniquely expressed in PI3Ki resistant tumors 
                                         Log2fc > |0.58|; (resistant - control)") + xlab("NES")


NES_filtered_B<-read.csv("split_plot_upload_filtered_B.csv", header = TRUE, stringsAsFactors = FALSE)
split_NES_filtered_B <- arrange(NES_filtered_B, abs(nes)) %>% 
  group_by(sign(nes)) %>% 
  slice(1:30)

ggplot(split_NES_filtered_B, aes(nes, fct_reorder(Description, nes), fill=pvalue), showCategory=10) + 
  geom_barh(stat='identity') + 
  scale_fill_continuous(low='red', high='blue', guide=guide_colorbar(reverse=TRUE)) + 
  theme_minimal() + ylab(NULL) + ggtitle("Phosphorylation site-specific pathway enrichment analysis", 
subtitle = "Differential phosphopeptides uniquely expressed between control and PI3Ki resistant tumors
Normalized to log2 fold change (resistant - control)") +
  xlab("Normalized Enrichment Score") + labs(caption = "PTM Enrichment Analysis (PTM-SEA) source code:\n http://github.com/broadinstitute/ssGSEA2.0.git") +
  theme(axis.text = element_text(size = 10, colour = 'black')) +
  theme(axis.title = element_text(size = 14)) +
  theme(title = element_text(size = 16)) +
  theme(plot.subtitle = element_text(size = 12)) +
theme(plot.caption = element_text(size = 10))




#geom_bar(stat='identity', aes(fill=mpg_type), width=.5)  +
 # scale_fill_manual(name="Mileage", 
  #                  labels = c("Above Average", "Below Average"), 
   #                 values = c("above"="#00ba38", "below"="#f8766d")) + 
