##==================================================================================================
## Exploratory Data Analysis project 2 question 1:
##
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.
##==================================================================================================
plot1 <- function() {

    NEI <- readRDS("summarySCC_PM25.rds")

    sumAllEmissionsPerYearUSA <- aggregate(Emissions ~ year, NEI, sum)

    barplot(
        height = sumAllEmissionsPerYearUSA$Emissions / 1000000, 
        names.arg = sumAllEmissionsPerYearUSA$year, 
        xlab = "Year", 
        ylab = expression("PM2.5 Emission (million ton)"),
        main = expression("PM2.5 Emissions from All Sources per Year - USA")
    )

    dev.copy(png, "plot1.png", width = 480, height = 480, units = "px")    

    dev.off()

}