##==================================================================================================
## Exploratory Data Analysis project 2 question 4:
##
## Across the United States, how have emissions from
## coal combustion-related sources changed from 1999-2008?
##==================================================================================================
plot4 <- function() {

    library(ggplot2)
    
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")

    #writeLines(unique(as.character(NEISCC[,8])), "NEISCC_08_Short.Name.txt")
    match_ext_comb <- grepl("Ext Comb", NEISCC$Short.Name, ignore.case = TRUE)
    match_int_comb <- grepl("Int Comb", NEISCC$Short.Name, ignore.case = TRUE)
    match_stn_comb <- grepl("Stationary Fuel Comb", NEISCC$Short.Name, ignore.case = TRUE)
    match_comb <- match_ext_comb | match_int_comb | match_stn_comb
    match_coal <- grepl("coal", NEISCC$Short.Name, ignore.case = TRUE)
    match_coalcomb <- match_coal & match_comb
    SCC_coalcomb <- SCC[match_coalcomb, ]$SCC
    NEI_coalcomb <- NEI[NEI$SCC %in% SCC_coalcomb, ]
    
    ggbar <- ggplot(
        data = NEI_coalcomb, 
        mapping = aes(x = factor(year), y = Emissions / 1000)
    ) + 
    geom_bar(stat = "identity") + 
    labs(x = "year") + 
    labs(y = expression("PM2.5 Emission (thousand ton)")) + 
    labs(title = expression("PM2.5 Emissions from Coal Combustion Sources per Year - USA"))
    
    print(ggbar)
    
    dev.copy(png, "plot4.png", width = 480, height = 480, units = "px")    
    
    dev.off()
    
}
