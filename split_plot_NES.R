


NES<-read.csv("split_plot_upload.csv", header = TRUE, stringsAsFactors = FALSE)
split_NES <- arrange(NES, abs(nes)) %>% 
  group_by(sign(nes)) %>% 
  slice(1:30)

ggplot(split_NES, aes(nes, fct_reorder(Description, nes), fill=pvalue), showCategory=10) + 
  geom_barh(stat='identity') + 
  scale_fill_continuous(low='red', high='blue', guide=guide_colorbar(reverse=TRUE)) + 
  theme_minimal() + ylab(NULL) + ggtitle("PTM-signature enrichment directionality", subtitle = "Normalized Enrichment Scores (NES) for UP & DOWN regulated phosphopeptides uniquely expressed in PI3Ki resistant tumors 
Log2fc > |0.58|; (resistant - control)") + xlab("NES")
