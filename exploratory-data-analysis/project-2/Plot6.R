## Question 6
## Compare emissions from motor vechicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County
## Which city has been greater changes over time in motor vehicle emissions?
## loading data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
library(ggplot2)
NEI.motorvehicle<- NEI[which(NEI$SCC %in% SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"]),]
both <- c("24510","06037")
NEI.motorvehicle.both<-subset(NEI.motorvehicle,fips %in% both)
g<-ggplot(NEI.motorvehicle.both,aes(year,Emissions,color=fips))
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions from motor vehicle for Los Angeles and Baltimore City",
                                                x="Year (1999 - 2008)")+scale_colour_discrete(name = "City", label = c("Los Angeles","Baltimore"))
dev.copy(png,file="Plot6.png")
dev.off()
## The Answer: The Los Angeles City has been greater change over time  and has been increased PM2.5 Emissions from motor vehicle
## Even though the Baltimore city has changed over time, there is the same number of PM2.5 Emissions in 1999 and 2008.
 
