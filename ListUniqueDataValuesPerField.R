plot0 <- function() {
    
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    NEISCC <- merge(NEI, SCC, by = "SCC")
    
    names(NEISCC)
    
    writeLines(unique(as.character(NEISCC[,1])), "NEISCC_01_SCC.txt")
    writeLines(unique(as.character(NEISCC[,2])), "NEISCC_02_fips.txt")
    writeLines(unique(as.character(NEISCC[,3])), "NEISCC_03_Pollutant.txt")
    writeLines(unique(as.character(NEISCC[,4])), "NEISCC_04_Emissions.txt")
    writeLines(unique(as.character(NEISCC[,5])), "NEISCC_05_type.txt")
    writeLines(unique(as.character(NEISCC[,6])), "NEISCC_06_year.txt")
    writeLines(unique(as.character(NEISCC[,7])), "NEISCC_07_Data.Category.txt")
    writeLines(unique(as.character(NEISCC[,8])), "NEISCC_08_Short.Name.txt")
    writeLines(unique(as.character(NEISCC[,9])), "NEISCC_09_EI.Sector.txt")
    writeLines(unique(as.character(NEISCC[,10])), "NEISCC_10_Option.Group.txt")
    writeLines(unique(as.character(NEISCC[,11])), "NEISCC_11_Option.Set.txt")
    writeLines(unique(as.character(NEISCC[,12])), "NEISCC_12_SCC.Level.One.txt")
    writeLines(unique(as.character(NEISCC[,13])), "NEISCC_13_SCC.Level.Two.txt")
    writeLines(unique(as.character(NEISCC[,14])), "NEISCC_14_SCC.Level.Three.txt")
    writeLines(unique(as.character(NEISCC[,15])), "NEISCC_15_SCC.Level.Four.txt")
    writeLines(unique(as.character(NEISCC[,16])), "NEISCC_16_Map.To.txt")
    writeLines(unique(as.character(NEISCC[,17])), "NEISCC_17_Last.Inventory.Year.txt")
    writeLines(unique(as.character(NEISCC[,18])), "NEISCC_18_Created_Date.txt")
    writeLines(unique(as.character(NEISCC[,19])), "NEISCC_19_Revised_Date.txt")
    writeLines(unique(as.character(NEISCC[,20])), "NEISCC_20_Usage.Notes.txt")

}
