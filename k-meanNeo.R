library(magrittr)
library(dplyr)
library(ggpubr)
library("ggplot2")
library("ComplexHeatmap")
library("circlize")
library("ggplotify")
library("grid")
library(factoextra)
#library(NbClust)
#library (cluster)
#library (factoextra)
#library (clustertend)


#https://afit-r.github.io/kmeans_clustering
#http://www.sthda.com/english/articles/31-principal-component-methods-in-r-practical-guide/122-multidimensional-scaling-essentials-algorithms-and-r-code/
#https://www.r-bloggers.com/2020/05/practical-guide-to-k-means-clustering/


#################_FP###################################################################
# Cmpute MDS
name <- Neo
mds <- Neo %>%
  dist() %>%          
  cmdscale() %>%
  as_tibble()
colnames(mds) <- c("Dim.1", "Dim.2")

# Plot MDS
ggscatter(mds, x = "Dim.1", y = "Dim.2", 
          label = rownames(name),
          size = 1,
          repel = TRUE)

#Calculate best Number for  clusters
fviz_nbclust(mds, kmeans, method = "wss") +
  geom_vline(xintercept = 5, linetype = 2) + # add line for better visualisation
  labs(subtitle = "Elbow method") # add subtitle

fviz_nbclust(mds, FUNcluster=kmeans, k.max = 8)+
  geom_vline(xintercept = 2, linetype = 2) + # add line for better visualisation
  labs(subtitle = " Silhouette method") # add subtitle


# K-means clustering 
kmeanstat <- kmeans(mds,
                    centers = 6,     #3 clusters,
                    nstart = 50,     #50 restarts,
                    iter.max = 25)

clust <-(kmeanstat)$cluster %>%
  as.factor()
mds <- mds %>%
  mutate(groups = clust)

# Plot and color by groups

options(ggrepel.max.overlaps = Inf)

p1 <- ggscatter(mds, x = "Dim.1", y = "Dim.2", 
                label = rownames(name),
                color = "groups", 
                palette = c("dark red","dark green","dark blue","purple","dark cyan","magenta","light blue","dark orange"),
                size = 6, 
                ellipse = TRUE,
                ellipse.type = "convex",show.legend.text=FALSE,
                repel = TRUE, label.rectangle=TRUE, font.label = c(15, "plain"),font.family="sans", ggtheme = theme_pubr(
                  base_size = 20))

##change legend####
plot<- ggpar(p1,
             legend = "top", legend.title = "Clusters",
             font.legend = c(20, "bold", "black"))

###export hi-res###
p <- as.ggplot(plot)
p

ggsave("/Users/FreddyMappin/Desktop/John_mds.png", width = 25, height = 25, units = "cm", dpi=300)


###save clustering stats
setwd('/Users/FreddyMappin/Desktop/SSAR_P1/Subgroups/')
getwd()
sink("kmean_statsjohn.txt")
kmeanstat
(kmeanstat)$betweenss
(kmeanstat)$totss
(kmeanstat)$tot.withinss
sink()

