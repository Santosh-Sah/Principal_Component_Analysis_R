source("PrincipalComponentAnalysisUtils.R")

principalComponentAnalysisDatasetList <- importPrincipalComponentAnalysisDataset("Principal_Component_Analysis_Wines.csv")

saveTrainingAndTestingDataset(principalComponentAnalysisDatasetList[[1]], principalComponentAnalysisDatasetList[[2]])
