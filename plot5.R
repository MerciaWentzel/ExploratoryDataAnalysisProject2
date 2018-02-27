##==================================================================================================
## Exploratory Data Analysis project 2 question 5:
##
## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
##==================================================================================================
plot5 <- function() {
    
    library(ggplot2)
    
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")

    #writeLines(unique(as.character(NEISCC[,14])), "NEISCC_14_SCC.Level.Two.txt")
    match_vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
    SCC_vehicle <- SCC[match_vehicle, ]$SCC
    NEI_vehicle <- NEI[NEI$SCC %in% SCC_vehicle, ]
    NEI_vehicle_Baltimore <- NEI_vehicle[NEI_vehicle$fips=="24510", ]

    ggbar <- ggplot(
        data = NEI_vehicle_Baltimore, 
        mapping = aes(x = factor(year), y = Emissions)
    ) + 
    geom_bar(stat = "identity") + 
    labs(x = "year") + 
    labs(y = expression("PM2.5 Emission (ton)")) + 
    labs(title = expression("PM2.5 Emissions from Motor Vehicle Sources per Year - Baltimore City"))

    print(ggbar)
    
    dev.copy(png, "plot5.png", width = 480, height = 480, units = "px")    
    
    dev.off()
    
}
