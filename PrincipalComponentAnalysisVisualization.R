source("PrincipalComponentAnalysisUtils.R")
library(ggplot2)
library(ElemStatLearn)

#reading training set 
principalComponentAnalysisTrainingSet <- readRDS("PrincipalComponentAnalysisTrainingSet.RDS")

#reading testing set data
principalComponentAnalysisTestingSet <- readRDS("PrincipalComponentAnalysisTestingSet.RDS")

#reading PrincipalComponentAnalysis with support vector model
principalComponentAnalysisWithSupportVectorModel = readRDS("principalComponentAnalysisWithSupportVectorModel.RDS")

#visualizing training set result
#It will take huge memory. If the system is not advance it will give memory error
visualisingTrainingSetResult <- function(principalComponentAnalysisTrainingSet, principalComponentAnalysisWithSupportVectorModel){
  
  set = principalComponentAnalysisTrainingSet
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
  grid_set = expand.grid(X1, X2)
  colnames(grid_set) = c('PC1', 'PC2')
  y_grid = predict(principalComponentAnalysisWithSupportVectorModel, newdata = grid_set)
  plot(set[, -3],
       main = 'Principal Component Analysis with support vector model (Training set)',
       xlab = 'PC1', ylab = 'PC2',
       xlim = range(X1), ylim = range(X2))
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_grid == 2, 'deepskyblue', ifelse(y_grid == 1, 'springgreen3', 'tomato')))
  points(set, pch = 21, bg = ifelse(set[, 3] == 2, 'blue3', ifelse(set[, 3] == 1, 'green4', 'red3')))
  
  ggsave("PrincipalComponentAnalysisTrainingsetResult.png")
  
}

#visualizing testing set result
visualisingTestingSetResult <- function(rincipalComponentAnalysisTestingSet, principalComponentAnalysisWithSupportVectorModel){
  
  set = rincipalComponentAnalysisTestingSet
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
  grid_set = expand.grid(X1, X2)
  colnames(grid_set) = c('PC1', 'PC2')
  y_grid = predict(principalComponentAnalysisWithSupportVectorModel, newdata = grid_set)
  plot(set[, -3], main = 'Principal Component Analysis with support vector model (Test set)',
       xlab = 'PC1', ylab = 'PC2',
       xlim = range(X1), ylim = range(X2))
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_grid == 2, 'deepskyblue', ifelse(y_grid == 1, 'springgreen3', 'tomato')))
  points(set, pch = 21, bg = ifelse(set[, 3] == 2, 'blue3', ifelse(set[, 3] == 1, 'green4', 'red3')))
  
  ggsave("SupportVectorMachineTestingsetResult.png")
  
}

visualisingTrainingSetResult(principalComponentAnalysisTrainingSet, principalComponentAnalysisWithSupportVectorModel)
visualisingTestingSetResult(principalComponentAnalysisTestingSet, principalComponentAnalysisWithSupportVectorModel)