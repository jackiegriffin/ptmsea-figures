## kinase prediction, output sequences + matched sequences and
# phosphorylated subsrates from raw data 
# THRESHOLD = kinase prediction score of 

if (!require("ggplot2")) install.packages("ggplot2")
library('ggplot2')

# start here trying to do heatplot fro stcratch
df <- read.csv('func_heat_map_th_3.csv', header = TRUE, stringsAsFactors = FALSE, row.names = 1)
colnames(df)
df$uniprot <- gsub('HUMAN','', df$uniprot)
df$uniprot <- gsub('_','', df$uniprot)

df$prot_mod <- paste(df$uniprot,df$modsite, sep = "_")


ggplot(df, aes(x=kinase, y = prot_mod, color = log2fc)) + 
  geom_point(shape=15) +
  scale_color_gradient(low="red", high="blue")  +
 #coord_equal() +
  theme(axis.text.x = element_text(angle = 90, hjust =1, vjust = 0.5))
theme(axis.text.y = element_text(hjust =1, vjust = 0.5))

  #geom_point(aes(color=log2fc)) +
  #geom_point(aes(shape = as.integer(log2fc))) +
  #scale_shape_identity(2) +
   #            
                                            
             
             