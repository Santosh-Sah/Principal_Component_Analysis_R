source("PrincipalComponentAnalysisUtils.R")
library(e1071)
library(caret)

#reading training set 
principalComponentAnalysisTrainingSet <- readRDS("PrincipalComponentAnalysisTrainingSet.RDS")

#feature scaling
principalComponentAnalysisTrainingSet[-14] = scale(principalComponentAnalysisTrainingSet[-14])

#here I have taken component 2.
principalComponentAnalysis = preProcess(x = principalComponentAnalysisTrainingSet[-14], method = 'pca', pcaComp = 2)

#applying principal component analysis on training set
principalComponentAnalysisTrainingSet = predict(principalComponentAnalysis, principalComponentAnalysisTrainingSet)

#arranging columns in required way
principalComponentAnalysisTrainingSet = principalComponentAnalysisTrainingSet[c(2, 3, 1)]

# Fitting PrincipalComponentAnalysis with SupportVectorMachine to the Training set
principalComponentAnalysisWithSupportVectorMachine = svm(formula = Customer_Segment ~ .,
                           data = principalComponentAnalysisTrainingSet,
                           type = 'C-classification',
                           kernel = 'linear')

#saving PrincipalComponentAnalysis with support vector machine model
savePrincipalComponentAnalysisWithSupportVectorMachineModel(principalComponentAnalysisWithSupportVectorMachine)

#saving PrincipalComponentAnalysis object
savePrincipalComponentAnalysis(principalComponentAnalysis)
