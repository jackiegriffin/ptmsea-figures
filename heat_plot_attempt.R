

# start here trying to do heatplot fro stcratch
df <- read.csv('func_heat_map.csv', header = TRUE, stringsAsFactors = FALSE, row.names = 1)
colnames(df)
df$uniprot <- gsub('HUMAN','', df$uniprot)
df$uniprot <- gsub('_','', df$uniprot)

df$prot_mod <- paste(df$uniprot,df$modsite, sep = "_")


ggplot(df, aes(x=prot_mod, y = kinase, color = log2fc)) + 
  geom_point() +
  scale_color_gradient(low="blue", high="red")  +
  coord_equal() +
  theme(axis.text.x = element_text(angle = 90, hjust =1, vjust = 0.5))
  #geom_point(aes(color=log2fc)) +
  #geom_point(aes(shape = as.integer(log2fc))) +
  #scale_shape_identity(2) +
   #            
                                            
             
             