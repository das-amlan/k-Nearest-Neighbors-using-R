library(ggplot2)
library(class)
library(psych)
library(caTools)
library(ISLR)


# ISLR package for the Caravan dataset.
# caravan is a customer data. It has 6000 customers 
# and 80 features/variables. 
# We check based on the features
# If they purchased insurance or not from Caravan.

database <- Caravan

describe(database)
str(database)


# Splitting the data

set.seed(101)

sample <- sample.split(database$Purchase,SplitRatio = 0.7)

traindata <- subset(database,sample == TRUE)
testdata <- subset(database,sample == FALSE)


Purschasetrain <- traindata[,86]
Purschasetest <- testdata[,86]


# Scale data
# Need to scale the data properly
# the KNN classifier predicts the class of a given 
# test observation by identifying the observations that are nearest to it, 
# the scale of the variables matters

stdtrainData <- scale(traindata[,-86])
stdtestData <- scale(testdata[,-86])

# KNN

predictPurchase <- knn(stdtrainData,stdtestData,Purschasetrain,k=1)
head(predictPurchase)

miscalError <- mean(Purschasetest != predictPurchase)
print(miscalError)


# Finding the optimum value of K
# Using the Elbow method

predictPurchase <- NULL
errorrate <- NULL

for (i in 1:20) {
  predictPurchase <-knn(stdtrainData,stdtestData,Purschasetrain,k=i)
  errorrate[i] <- mean(Purschasetest != predictPurchase)
}
print(errorrate)

Kvalue <- 1:20
dfError <- data.frame(Kvalue,errorrate)

ggplot(dfError,aes(Kvalue,errorrate)) + 
  geom_point() + geom_line(Ity = "doted",color = "red") + theme_bw()


# KNN with K = 7
predictPurchase <- knn(stdtrainData,stdtestData,Purschasetrain,k=7)
head(predictPurchase)

miscalError <- mean(Purschasetest != predictPurchase)
print(miscalError)



