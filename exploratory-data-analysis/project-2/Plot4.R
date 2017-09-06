## Question 4
## Across the U.S, how have emissions from coal combustion-related sources changed from 1999-2008 ?
## loading data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
##subset2 is the coal combustion-related source emissions'data
library(ggplot2)
NEI.Coal<- NEI[which(NEI$SCC %in% SCC[grep("coal",SCC$Short.Name,ignore.case = TRUE),"SCC"]),]
g<-ggplot(NEI.Coal,aes(year,Emissions))
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions from coal combustion-related sources",
                                                x="Year (1999-2008)")

dev.copy(png,file="Plot4.png")
dev.off()
## The Answer: From 2005 to 2008, there is a significat rapid decrease in coal combustion-related sources. 
## Comparing with the number of PM2.5 emission from coal combustion-related in 1999, almost decrease 275000 emissions.