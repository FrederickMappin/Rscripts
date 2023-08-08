library(mlbench)
library(e1071)
#### Quick Data PEEKS#######
# load the dataset
neo =PimaIndiansDiabetes

# display first 20 rows of data
head(neo, n=20)

# display the dimensions of the dataset
dim(neo)

#list types for each attribute
sapply(neo, class)

# summarize the dataset
summary(neo)

# calculate standard deviation for all attributes
sapply(neo[,1:8], sd)


skew <- apply(neo[,1:8], 2, skewness)
# display skewness, larger/smaller deviations from 0 show more skew
print(skew)


correlations <- cor(neo[,1:8])
# display the correlation matrix
print(correlations)


