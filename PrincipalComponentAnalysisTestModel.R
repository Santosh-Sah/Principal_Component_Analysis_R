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

#reading PrincipalComponentAnalysis with support vector model
principalComponentAnalysisWithSupportVectorModel = readRDS("PrincipalComponentAnalysisWithSupportVectorMachineModel.RDS")

#predicting testing set result.
y_pred = predict(principalComponentAnalysisWithSupportVectorModel ,newdata = principalComponentAnalysisTestingSet[-3])

#Saving prediced values for testing set
savePrincipalComponentAnalysisPredictedValuesForTestingSet(y_pred)

