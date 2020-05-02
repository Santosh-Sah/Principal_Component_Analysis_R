source("PrincipalComponentAnalysisUtils.R")
library(e1071)
library(caret)

#reading PrincipalComponentAnalysis object
principalComponentAnalysis <- readRDS("PrincipalComponentAnalysis.RDS")

#reading testing set data
principalComponentAnalysisTestingSet <- readRDS("PrincipalComponentAnalysisTestingSet.RDS")

#feature scaling
principalComponentAnalysisTestingSet[-14] = scale(principalComponentAnalysisTestingSet[-14])

#applying principal component analysis on testing set
principalComponentAnalysisTestingSet = predict(principalComponentAnalysis, principalComponentAnalysisTestingSet)

#arranging columns in required way
principalComponentAnalysisTestingSet = principalComponentAnalysisTestingSet[c(2, 3, 1)]

#reading predicted values of the testing set
principalComponentAnalysisPredictedValuesForTestingSet <- readRDS("PrincipalComponentAnalysisPredictedValuesForTestingSet.RDS")

principalComponentAnalysisConfusionMatrix = table(principalComponentAnalysisTestingSet[, 3], principalComponentAnalysisPredictedValuesForTestingSet)

principalComponentAnalysisConfusionMatrix

#    1  2  3
# 1 12  0  0
# 2  1 13  0
# 3  0  1  9