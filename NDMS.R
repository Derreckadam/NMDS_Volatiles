#install.packages("vegan")
library(vegan)
library(readxl)
set.seed(2)
community_matrix=matrix(
   sample(1:100,300,replace=T),nrow=10,
   dimnames=list(paste("community",1:10,sep=""),paste("sp",1:30,sep="")))
community_matrix
volatiles_names <- read_excel("/Volumes/GoogleDrive/My Drive/Manuscripts/Fungal Response/data.xlsx", sheet = "Sheet3")
volatiles <- read_excel("/Volumes/GoogleDrive/My Drive/Manuscripts/Fungal Response/data.xlsx", sheet = "Sheet4")
rownames(volatiles) <- volatiles_names$X__1
volatiles
volatiles.matrix=as.matrix(volatiles)
volatiles.matrix
test_NMDS=metaMDS(volatiles.matrix, k=2)
example_NMDS=metaMDS(volatiles.matrix, # Our community-by-species matrix
                     k=2) # The number of reduced dimensions
stressplot(example_NMDS)
plot(example_NMDS)
treat=c(rep("Bacillus",9),rep("Control",5),rep("Red",9),rep("White",8))
ordiplot(example_NMDS,type="n")
ordihull(example_NMDS,groups=treat,draw="polygon",col="grey90",label=F)
orditorp(example_NMDS,display="sites",col=c(rep("green",9),rep("blue",5),rep("red",9),rep("black",8)),
   air=0.01,cex=1.25)


setwd("/Volumes/GoogleDrive/My Drive/Manuscripts/Fungal Response/")
pdf("NMDS.pdf", height = 12, width = 12)
plot(example_NMDS)
treat=c(rep("Bacillus",9),rep("Control",5),rep("Red",9),rep("White",8))
ordiplot(example_NMDS,type="n")
ordihull(example_NMDS,groups=treat,draw="polygon",col="grey90",label=F)
orditorp(example_NMDS,display="sites",col=c(rep("green",9),rep("blue",5),rep("red",9),rep("black",8)),
   air=0.01,cex=1.25)
dev.off()
