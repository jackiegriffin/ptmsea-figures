if (!require('gplots')) install.packages('gplots')
library('gplots')
BiocManager::install('DOSE')
BiocManager::install('clusterProfiler')

if (!require("DOSE")) install.packages("DOSE")
library('DOSE')
if(!require("clusterProfiler")) install.packages("clusterProfiler")
library('clusterProfiler')
if (!require("enrichplot")) install.packages("enrichplot")
library('enrichplot')
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

data(geneList)
 install.packages('org.Hs.eg.db')


de<-names(geneList)[abs(geneList)>2]
edo <- enrichDGN(de)
library(enrichplot)
barplot(edo, showCategory=20)

edo2 <- gseNCG(geneList, nPerm=10000)
p1 <- dotplot(edo, showCategory=30) + ggtitle("dotplot for ORA")
p2 <- dotplot(edo2, showCategory=30) + ggtitle("dotplot for GSEA")

plot_grid(p1, p2, ncol=2)

## convert gene ID to Symbol

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("org.Hs.eg.db")

edox <- setReadable(edo, 'org.Hs.eg.db', 'ENTREZID')

p1 <- cnetplot(edox, foldChange=geneList)
## categorySize can be scaled by 'pvalue' or 'geneNum'
p2 <- cnetplot(edox, categorySize="pvalue", foldChange=geneList)
p3 <- cnetplot(edox, foldChange=geneList, circular = TRUE, colorEdge = TRUE)
cowplot::plot_grid(p1, p2, p3, ncol=3, labels=LETTERS[1:3], rel_widths=c(.8, .8, 1.2))

p1 <- cnetplot(edox, node_label="category") 
p2 <- cnetplot(edox, node_label="gene") 
p3 <- cnetplot(edox, node_label="all") 
p4 <- cnetplot(edox, node_label="none") 
cowplot::plot_grid(p1, p2, p3, p4, ncol=2, labels=LETTERS[1:4])



p1 <- emapplot(edo)
p2 <- emapplot(edo, pie_scale=1.5)
p3 <- emapplot(edo,layout="kk")
p4 <- emapplot(edo, pie_scale=1.5,layout="kk") 
cowplot::plot_grid(p1, p2, p3, p4, ncol=2, labels=LETTERS[1:4])



library(clusterProfiler)
data(gcSample)
xx <- compareCluster(gcSample, fun="enrichKEGG",
                     organism="hsa", pvalueCutoff=0.05)
p1 <- emapplot(xx)
p2 <- emapplot(xx,legend_n=2) 
p3 <- emapplot(xx,pie="count")
p4 <- emapplot(xx,pie="count", pie_scale=1.5, layout="kk")
cowplot::plot_grid(p1, p2, p3, p4, ncol=2, labels=LETTERS[1:4])


p1 <- heatplot(edox)
p2 <- heatplot(edox, foldChange = geneList)
cowplot::plot_grid(p1, p2, ncol=1, labels = LETTERS[1:2])













grid plot in R
#cowplot::plot_grid()
