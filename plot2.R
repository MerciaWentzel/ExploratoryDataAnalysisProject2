##==================================================================================================
## Exploratory Data Analysis project 2 question 2:
##
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008?
## Use the base plotting system to make a plot answering this question.
##==================================================================================================
plot2 <- function() {
    
    NEI <- readRDS("summarySCC_PM25.rds")

    NEI_Baltimore <- NEI[NEI$fips=="24510", ]
    
    sumAllEmissionsPerYearBaltimore <- aggregate(Emissions ~ year, NEI_Baltimore, sum)
    
    barplot(
        height = sumAllEmissionsPerYearBaltimore$Emissions, 
        names.arg = sumAllEmissionsPerYearBaltimore$year, 
        xlab = "Year", 
        ylab = expression("PM2.5 Emission (ton)"),
        main = expression("PM2.5 Emissions from All Sources per Year - Baltimore City")
    )
    
    dev.copy(png, "plot2.png", width = 480, height = 480, units = "px")    
    
    dev.off()
    
}
