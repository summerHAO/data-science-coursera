## Question 6
## Compare emissions from motor vechicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County
## Which city has been greater changes over time in motor vehicle emissions?
## loading data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
emissionFromMotorVehiclesInLosAngeles <- NEI[NEI$SCC %in% motorVehicleSourceCodes$SCC & 
                                               NEI$fips == "06037", ]
emissionFromMotorVehicles <- rbind(emissionFromMotorVehiclesInBaltimore, emissionFromMotorVehiclesInLosAngeles)

## Calculate the emissions due to motor vehicles in Baltimore and Los Angeles
## for every year
totalMotorVehicleEmissionsByYearAndByCounty <- aggregate(Emissions ~ fips * 
                                                           year, data = emissionFromMotorVehicles, FUN = sum)
totalMotorVehicleEmissionsByYearAndByCounty$county <- ifelse(totalMotorVehicleEmissionsByYearAndByCounty$fips == 
                                                               "06037", "Los Angeles", "Baltimore")

## Load libraries required for plot
library(ggplot2)
library(grid)

## Setup ggplot with data frame
q <- qplot(y = Emissions, x = year, data = totalMotorVehicleEmissionsByYearAndByCounty, 
           color = county)
## Add layers
q + scale_x_continuous(breaks = seq(1999, 2008, 3)) + theme_bw() + geom_point(size = 3) + 
  geom_line() + labs(y = expression("Motor  Vehicle Related " * PM[2.5] * 
                                      " Emissions (in tons)")) + labs(x = "Year") + labs(title = expression("Motor  Vehicle Related " * 
                                                                                                              PM[2.5] * " Emissions in Baltimore & Los Angeles (1999 - 2008)")) + theme(axis.text = element_text(size = 8), 
                                                                                                                                                                                        axis.title = element_text(size = 14), panel.margin = unit(1, "lines"), plot.title = element_text(vjust = 2, 
                                                                                                                                                                                                                                                                                         hjust = 0.17, size = 12), legend.title = element_text(size = 11)) + 
  scale_colour_discrete(name = "County")
dev.copy(png,file="Plot6.png")
dev.off()
## The Answer: The Los Angeles City has been greater change over time 

 
