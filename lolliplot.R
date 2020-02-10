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

## === lolliplot of kinase prediction (networKIN score > 10) of upregulated phoshopeptides UPregulated in pi3k resistant---
colnames(net10)
net10<-read.csv("networkin_input.csv", header = TRUE, stringsAsFactors = FALSE)
ggplot(net10, showCategory = 50, 
       aes(richFactor, fct_reorder(Description, richFactor))) + 
  geom_segment(aes(xend=0, yend = Description)) +
  geom_point(aes(color=log2FC, size = Substrate_count)) +
  scale_color_viridis_c(guide=guide_colorbar(reverse=FALSE), direction = -1) +
  scale_size_continuous(range=c(2, 10)) +
  theme_minimal() + 
  xlab("Kinase Prediction Score") +
  ylab(NULL) + 
  labs(caption = "NetworKIN 3.0; Nat Methods 11, 603–604 (2014)") +
  theme(axis.text = element_text(size = 12, colour = 'black')) +
  theme(axis.title = element_text(size = 14)) +
  theme(title = element_text(size = 18)) +
  theme(plot.subtitle = element_text(size = 10)) +
  ggtitle("Top predicted kinases", subtitle = "Phosphopeptides uniquely upregulated in PI3Ki resistant tumors (n=1786)") +
  theme(plot.caption = element_text(size = 10))

## === lolliplot of kinase prediction (networKIN score > 10) of down phoshopeptides UPregulated in pi3k resistant---

  
net_down<-read.csv("networkin_input_down.csv", header = TRUE, stringsAsFactors = FALSE)
ggplot(net_down, showCategory = 50, 
       aes(richFactor, fct_reorder(Description, richFactor))) + 
  geom_segment(aes(xend=0, yend = Description)) +
  geom_point(aes(color=log2FC, size = Substrate_count)) +
  scale_color_viridis_c(guide=guide_colorbar(reverse=FALSE), direction = 1) +
  scale_size_continuous(range=c(2, 10)) +
  theme_minimal() + 
  xlab("Kinase Prediction Score") +
  ylab(NULL) + 
  labs(caption = "NetworKIN 3.0; Nat Methods 11, 603–604 (2014)") +
  theme(axis.text = element_text(size = 12, colour = 'black')) +
  theme(axis.title = element_text(size = 14)) +
  theme(title = element_text(size = 18)) +
  theme(plot.subtitle = element_text(size = 10)) +
  ggtitle("Top predicted kinases", subtitle = "Phosphopeptides uniquely downregulated in PI3Ki resistant tumors (n=3183)") +
  theme(plot.caption = element_text(size = 10))
  
  
  
  