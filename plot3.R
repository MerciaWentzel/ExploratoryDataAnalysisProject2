##==================================================================================================
## Exploratory Data Analysis project 2 question 3:
##
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 1999-2008?
## Use the ggplot2 plotting system to make a plot answer this question.
##==================================================================================================
plot3 <- function() {

    library(ggplot2)
    
    NEI <- readRDS("summarySCC_PM25.rds")

    NEI_Baltimore <- NEI[NEI$fips=="24510", ]
    
    ggbar <- ggplot(
        data = NEI_Baltimore, 
        mapping = aes(x = factor(year), y = Emissions, fill = type)
    ) + 
    geom_bar(stat = "identity") +
    facet_grid(. ~ type) +
    labs(x = "year") +
    labs(y = expression("PM2.5 Emission (ton)")) +
    labs(title = expression("PM2.5 Emissions from All Sources per Year by Type - Baltimore City"))
    
    print(ggbar)
    
    dev.copy(png, "plot3.png", width = 480, height = 480, units = "px")    
    
    dev.off()
    
}
