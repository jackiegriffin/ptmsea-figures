## kinase prediction, output sequences + matched sequences and
# phosphorylated subsrates from raw data 
# THRESHOLD = kinase prediction score of 

if (!require("ggplot2")) install.packages("ggplot2")
library('ggplot2')



# ----------------- kinase prediction score less than 10 theshold
# FINAL
net_10 <- read.csv("net_greater_10_reorder.csv", header = TRUE, stringsAsFactors = FALSE, row.names = 1)
net_10_positive <- net_10[net_10$log2fc > 0,]

net_10_positive$uniprot <- gsub('HUMAN','', net_10_positive$uniprot)
net_10_positive$uniprot <- gsub('_','', net_10_positive$uniprot)
net_10_positive$prot_mod <- paste(net_10_positive$uniprot,net_10_positive$modsite, sep = "_")

ggplot(net_10_positive, aes(x=prot_mod, y = kinase, color = log2fc)) + 
  geom_point(shape=15, size=5.3) +
  scale_colour_gradient2(low = "#80cdc1", high = "#003c30") +
  #scale_colour_gradient2(low = "#8c510a", high = "#01665e") +
 # scale_colour_gradient(low = "red", high = "blue") +
  # low "#268bd2"
  # high "#dc322f"
  coord_equal() +
  theme(axis.text.x = element_text(angle = 90, hjust =1, vjust = 0.5, size = 12)) +
  theme(axis.text.y = element_text(hjust =1, vjust = 0.5, size = 12)) +
  
  theme(axis.title.y = element_text(hjust = 0.5, vjust = 1.5, size = 14)) +
  theme(axis.title.x = element_text(hjust = 0.5, vjust = 1.5, size = 14)) +
  theme(plot.title = element_text(size = 24)) +
  theme(plot.subtitle = element_text(size = 12)) +
  
  xlab("Substrate_phosphorylation site") +
  ylab("Kinase") +
  ggtitle("Kinase-substrate associations for top predicted kinases", subtitle = "Phosphopeptides uniquely upregulated in PI3Ki resistant tumors (n=1786)
NetworKIN score > 10")


# ---down boiled down late 

net_down_final <- read.csv("net_down_10_final.csv", header = TRUE, stringsAsFactors = FALSE, row.names = 1)
#net_n <- net_n_p[net_n_p$log2fc < 0,]

net_down_final$uniprot <- gsub('HUMAN','', net_down_final$uniprot)
net_down_final$uniprot <- gsub('_','', net_down_final$uniprot)
net_down_final$prot_mod <- paste(net_down_final$uniprot,net_down_final$modsite, sep = "_")

ggplot(net_down_final, aes(x=prot_mod, y = kinase, color = log2fc)) + 
  geom_point(shape=15, size = 2.5) +
  scale_colour_gradient(low = "blue", high = "red") +
  coord_equal() +
  theme(axis.text.x = element_text(angle = 90, hjust =1, vjust = 0.5)) +
  theme(axis.text.y = element_text(hjust =1, vjust = 0.5)) +
  
  theme(axis.title.y = element_text(hjust = 0.5, vjust = 1.5, size = 14)) +
  theme(axis.title.x = element_text(hjust = 0.5, vjust = 1.5, size = 14)) +
  theme(plot.title = element_text(size = 24)) +
  theme(plot.subtitle = element_text(size = 12)) +
  
  xlab("Substrate_phosphorylation site") +
  ylab("Kinase") +
  ggtitle("Kinase-substrate associations for top predicted kinases", subtitle = "Phosphopeptides uniquely downregulated in PI3Ki resistant tumors (n=3183)
NetworKIN score > 10")


#### ----- positive and negative threshold of 10 -------

net_n_p <- read.csv("net_threshold_10.csv", header = TRUE, stringsAsFactors = FALSE, row.names = 1)
net_n <- net_n_p[net_n_p$log2fc < 0,]

net_n$uniprot <- gsub('HUMAN','', net_n$uniprot)
net_n$uniprot <- gsub('_','', net_n$uniprot)
net_n$prot_mod <- paste(net_n$uniprot,net_n$modsite, sep = "_")

ggplot(net_n, aes(x=prot_mod, y = kinase, color = log2fc)) + 
  geom_point(shape=15, size = 2.5) +
  scale_colour_gradient(low = "blue", high = "red") +
  coord_equal() +
  theme(axis.text.x = element_text(angle = 90, hjust =1, vjust = 0.5)) +
  theme(axis.text.y = element_text(hjust =1, vjust = 0.5)) +
  
  theme(axis.title.y = element_text(hjust = 0.5, vjust = 1.5, size = 14)) +
  theme(axis.title.x = element_text(hjust = 0.5, vjust = 1.5, size = 14)) +
  theme(plot.title = element_text(size = 24)) +
  theme(plot.subtitle = element_text(size = 12)) +
  
  xlab("Substrate_phosphorylation site") +
  ylab("Kinase") +
  ggtitle("Kinase-substrate associations for top predicted kinases", subtitle = "Phosphopeptides uniquely downregulated in PI3Ki resistant tumors (n=1786)
NetworKIN score > 10")



# ----------------------------------------------------------


















# start here trying to do heatplot fro stcratch
df <- read.csv('func_heat_map_th_3.csv', header = TRUE, stringsAsFactors = FALSE, row.names = 1)
colnames(df)
df$uniprot <- gsub('HUMAN','', df$uniprot)
df$uniprot <- gsub('_','', df$uniprot)

df$prot_mod <- paste(df$uniprot,df$modsite, sep = "_")


ggplot(df, aes(x=kinase, y = prot_mod, color = log2fc)) + 
  geom_point(shape=15) +
  #scale_fill_manual(name="Change since 2002\n(white = no data)",
   ##                 values=c("#543005", "#8c510a", "#bf812d", "#dfc27d",
     #                        "#e0e0e0", "#80cdc1", "#35978f", "#01665e", "#003c30"),
         #           guide=guide_legend(reverse=TRUE)) +
# low "#268bd2"
  # high "#dc322f"
  scale_colour_gradient2(low = "#8c510a", high = "#01665e") +
#coord_equal() +
  theme(axis.text.x = element_text(angle = 90, hjust =1, vjust = 0.5)) +
theme(axis.text.y = element_text(hjust =1, vjust = 0.5, size = 5))



## WIHTOUT SUBUNITES ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
df_sub <- read.csv('func_heat_plot_without_subunits.csv', header = TRUE, stringsAsFactors = FALSE, row.names = 1)
colnames(df)

df_sub$uniprot <- gsub('HUMAN','', df_sub$uniprot)
df_sub$uniprot <- gsub('_','', df_sub$uniprot)
df_sub$prot_mod <- paste(df_sub$uniprot,df_sub$modsite, sep = "_")

df_sub$prot_mod <- paste(df_sub$uniprot,df$modsite, sep = "_")
ggplot(df_sub, aes(x=prot_mod, y = kinase, color = log2fc)) + 
  geom_point(shape=15) +
  #scale_fill_manual(name="Change since 2002\n(white = no data)",
  ##                 values=c("#543005", "#8c510a", "#bf812d", "#dfc27d",
  #                        "#e0e0e0", "#80cdc1", "#35978f", "#01665e", "#003c30"),
  #           guide=guide_legend(reverse=TRUE)) +
  # low "#268bd2"
  # high "#dc322f"
  scale_colour_gradient2(low = "#8c510a", high = "#01665e") +
  #coord_equal() +
  theme(axis.text.x = element_text(angle = 90, hjust =1, vjust = 0.5)) +
  theme(axis.text.y = element_text(hjust =1, vjust = 0.5, size = 8))
  #geom_point(aes(color=log2fc)) +
  #geom_point(aes(shape = as.integer(log2fc))) +
  #scale_shape_identity(2) +
   #            


dr_sub_filtered <- df_sub[df_sub$log2fc > 2,]
dr_sub_filtered$uniprot <- gsub('HUMAN','', dr_sub_filtered$uniprot)
dr_sub_filtered$uniprot <- gsub('_','', dr_sub_filtered$uniprot)
dr_sub_filtered$prot_mod <- paste(dr_sub_filtered$uniprot,dr_sub_filtered$modsite, sep = "_")


ggplot(df_sub, aes(x=prot_mod, y = kinase, color = log2fc)) + 
  geom_point(shape=15) +
  scale_colour_gradient(low = "red", high = "blue") +
 # coord_equal() +
  theme(axis.text.x = element_text(angle = 90, hjust =1, vjust = 0.5)) +
  theme(axis.text.y = element_text(hjust =1, vjust = 0.5, size = 8)) +
  geom_violin()
                       

