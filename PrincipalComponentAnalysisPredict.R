source("PrincipalComponentAnalysisUtils.R")
library(e1071)
library(caret)

#I am taking new observation from the testing set on for simplicity.
#I could have created new observation and predict. I am taking records from testing set as a new observation for simplicity.

#reading PrincipalComponentAnalysis object
principalComponentAnalysis <- readRDS("PrincipalComponentAnalysis.RDS")

#reading testing set data
principalComponentAnalysisTestingSet <- readRDS("PrincipalComponentAnalysisTestingSet.RDS")

#taking only two records from the testing set.
#we can create new data frame to predict
principalComponentAnalysisTestingSet <- principalComponentAnalysisTestingSet[2:3,]

#feature scaling
principalComponentAnalysisTestingSet[-14] = scale(principalComponentAnalysisTestingSet[-14])

#applying principal component analysis on new observation
principalComponentAnalysisTestingSet = predict(principalComponentAnalysis, principalComponentAnalysisTestingSet)

#arranging columns in required way
principalComponentAnalysisTestingSet = principalComponentAnalysisTestingSet[c(2, 3, 1)]

#reading PrincipalComponentAnalysis with support vector model
principalComponentAnalysisWithSupportVectorModel = readRDS("PrincipalComponentAnalysisWithSupportVectorMachineModel.RDS")

#predicting testing set result.
y_pred = predict(principalComponentAnalysisWithSupportVectorModel ,newdata = principalComponentAnalysisTestingSet[-3])

y_pred
