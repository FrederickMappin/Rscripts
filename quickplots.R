#Univariate Plots: Histograms, Density Plots, Box And Whisker Plots, Bar Plots and Missing Plot
#Multivariate Plots: Correlation Plot, Scatterplot Matrix, Scatterplot Matrix By Class, Density By Class and Box And Whisker Plots By Class.

# load the data 
data(iris)
data(BreastCancer)


# create histograms for each attribute
par(mfrow=c(1,4))
for(i in 1:4) {
  hist(iris[,i], main=names(iris)[i])
}

# create a panel of simpler density plots by attribute
par(mfrow=c(1,4))
for(i in 1:4) {
  plot(density(iris[,i]), main=names(iris)[i])
}

# Create separate boxplots for each attribute
par(mfrow=c(1,4))
for(i in 1:4) {
  boxplot(iris[,i], main=names(iris)[i])
}



# create a bar plot of each categorical attribute
par(mfrow=c(2,4))
for(i in 1:4) {
  counts <- table(iris[,i])
  name <- names(iris)[i]
  barplot(counts, main=name)
}

# load packages
library(Amelia)
library(mlbench)
# load dataset
data(Soybean)
# create a missing map
missmap(Soybean, col=c("black", "grey"), legend=FALSE)

# load package
install.packages("corrplot")
library(corrplot)
# load the data
data(iris)
# calculate correlations
correlations <- cor(iris[,1:4])
# create correlation plot
corrplot(correlations, method="circle")



# pair-wise scatterplots of all 4 attributes
pairs(iris)


# pair-wise scatterplots colored by class pairs(Species~., data=iris, col=iris$Species)
pairs(Species~., data=iris, col=iris$Species)



# load the package
library(caret)
# load the data
data(iris)
# density plots for each attribute by class value
x <- iris[,1:4]
y <- iris[,5]
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)

# box and whisker plots for each attribute by class value
x <- iris[,1:4]
y <- iris[,5]
featurePlot(x=x, y=y, plot="box")