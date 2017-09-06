## Question 5
## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City ?
## loading data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
library(ggplot2)
NEI.motorvehicle.baltimore<- NEI[which(NEI$SCC %in% SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"] & NEI$fips=="24510"),]
g<-ggplot(NEI.motorvehicle,aes(year,Emissions))
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions from motor vehicle for Baltimore City",x="Year (1999-2008)")

dev.copy(png,file="Plot5.png")
dev.off()
## The Answer: There is a increase trend among in 1999-2005, after 2005, the amount of PM2.5 emissions dereased.
