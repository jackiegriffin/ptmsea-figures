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
if (!require("ggstance")) install.packages("ggdtance")
library('ggstance')
if (!require("plyr")) install.packages("plyr")
library('plyr')
if (!require("dplyr")) install.packages("dplyr")
library('dplyr')
if (!require("viridis")) install.packages("viridis")
library("viridis")

net10<-read.csv("networkin_input.csv", header = TRUE, stringsAsFactors = FALSE)

ggplot(net10, showCategory = 50, 
       aes(richFactor, fct_reorder(Description, richFactor))) + 
  geom_segment(aes(xend=0, yend = Description)) +
  geom_point(aes(color=log2FC, size = Substrate_count)) +
  scale_color_viridis_c(guide=guide_colorbar(reverse=FALSE), direction = -1) +
  scale_size_continuous(range=c(2, 10)) +
  theme_minimal() + 
  xlab("Kinase Prediction Score (NetworKIN)") +
  ylab(NULL) + 
  theme(axis.text = element_text(size = 12, colour = 'black')) +

  theme(axis.title = element_text(size = 14)) +
  theme(title = element_text(size = 16)) +
  theme(plot.subtitle = element_text(size = 12)) +
  
  ggtitle("Top predicted kinases", subtitle = " From phosphopeptides uniquely upregulated in PI3Ki resistant tumors") 

