importPrincipalComponentAnalysisDataset <- function(principalComponentAnalysisDatasetFileName) {
  
  #importing dataset
  principalComponentAnalysisDataset = read.csv(principalComponentAnalysisDatasetFileName)
  
  #splitting the dataset into training set and testing set
  library(caTools)
  set.seed(1234)
  
  principalComponentAnalysisDatasetSlpit = sample.split(principalComponentAnalysisDataset$Customer_Segment, SplitRatio = 0.80)
  
  principalComponentAnalysisTrainingSet = subset(principalComponentAnalysisDataset, principalComponentAnalysisDatasetSlpit == TRUE)
  
  principalComponentAnalysisTestingSet = subset(principalComponentAnalysisDataset, principalComponentAnalysisDatasetSlpit == FALSE)
  
  
  returnList <- list(principalComponentAnalysisTrainingSet, principalComponentAnalysisTestingSet)
  
  return (returnList)
  
}

#saving training and testing set
saveTrainingAndTestingDataset <- function(principalComponentAnalysisTrainingSet, principalComponentAnalysisTestingSet){
  
  saveRDS(principalComponentAnalysisTrainingSet, file = "PrincipalComponentAnalysisTrainingSet.RDS")
  saveRDS(principalComponentAnalysisTestingSet, file = "PrincipalComponentAnalysisTestingSet.RDS")
  
}

#Save PrincipalComponentAnalysis with SupportVectorMachine Model
savePrincipalComponentAnalysisWithSupportVectorMachineModel <- function(principalComponentAnalysisWithSupportVectorMachineModel) {
  
  saveRDS(principalComponentAnalysisWithSupportVectorMachineModel, file = "PrincipalComponentAnalysisWithSupportVectorMachineModel.RDS")
}

#Save prediced values for testing set
savePrincipalComponentAnalysisPredictedValuesForTestingSet <- function(principalComponentAnalysisPredictedValuesForTestingSet) {
  
  saveRDS(principalComponentAnalysisPredictedValuesForTestingSet, file = "PrincipalComponentAnalysisPredictedValuesForTestingSet.RDS")
}

#Save PrincipalComponentAnalysis object
savePrincipalComponentAnalysis <- function(principalComponentAnalysis) {
  
  saveRDS(principalComponentAnalysis, file = "PrincipalComponentAnalysis.RDS")
}
