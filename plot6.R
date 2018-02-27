##==================================================================================================
## Exploratory Data Analysis project 2 question 6:
##
## Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?
##==================================================================================================
plot6 <- function() {
    
    library(ggplot2)
    
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
    match_vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
    SCC_vehicle <- SCC[match_vehicle, ]$SCC
    NEI_vehicle <- NEI[NEI$SCC %in% SCC_vehicle, ]
    NEI_vehicle_Baltimore <- NEI_vehicle[NEI_vehicle$fips=="24510", ]
    NEI_vehicle_LosAngeles <- NEI_vehicle[NEI_vehicle$fips=="06037", ]
    NEI_vehicle_Baltimore$city <- "Baltimore City"
    NEI_vehicle_LosAngeles$city <- "Los Angeles County" 
    NEI_vehicle_BaltiAngeles <- rbind(NEI_vehicle_Baltimore, NEI_vehicle_LosAngeles)
    
    ggbar <- ggplot(
        data = NEI_vehicle_BaltiAngeles, 
        mapping = aes(x = factor(year), y = Emissions, fill = city)
    ) + 
    geom_bar(stat = "identity") +
    facet_grid(. ~ city) +
    labs(x = "year") + 
    labs(y = expression("PM2.5 Emission (ton)")) + 
    labs(title = expression("PM2.5 Emissions from Motor Vehicle Sources per Year - Baltimore vs LA"))
    
    print(ggbar)
    
    dev.copy(png, "plot6.png", width = 480, height = 480, units = "px")    
    
    dev.off()
    
}