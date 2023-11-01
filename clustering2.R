library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(dendextend) # for comparing two dendrograms
library(ggplot2)
library(plotly)
library(ggplot2)
library(ggdendro)










# Compute the dissimilarity matrix
res.dist <- dist(D1, method = "maximum")

# Hierarchical clustering using wardLinkage
res.hc <- hclust(d=res.dist, method = "ward.D2" )
png("Plot3.png", width = 18, height = 4, units = 'in', res = 300)
hc1<- plot(res.hc, cex = 0.6, hang = -1, main="")
clusters <- rect.hclust(res.hc, h = 25,border = 2:5)


dev.off()

#Computes the “agglomerative coefficient”, measuring the clustering structure of the dataset.
coef.hclust(res.hc)


setwd('/Users/FreddyMappin/Desktop/')
getwd()
sink("clustered_stats.txt")

clusters
sink()










library(ggplot2)
# Rectangle dendrogram using ggplot2
ggd1 <- as.ggdend(hc1)
ggplot(ggd1) 