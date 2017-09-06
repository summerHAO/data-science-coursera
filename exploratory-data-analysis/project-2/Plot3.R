## Question 3
## Which of these four sources have been increase in emissions from 1999-2008 for Baltimore City ?
## Which of these four sources have been decrease in emissions from 1999-2008 for Baltimore City ?
## loading data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
## susbet1 is Baltimore city's NEI
library(ggplot2)
NEI.BaltimoreCity<-NEI[NEI$fips=="24510",]
g<-ggplot(NEI.BaltimoreCity,aes(year,Emissions,color=type))
g+geom_line(stat = "summary",fun.y="sum")+labs(y="Emission For the Baltimore City (in tons)",
                                               x="Year (1999-2008)")

dev.copy(png,file="Plot3.png")
dev.off()
## The Answer is that point sources has been increased from 2002 to 2005 and then dereased to 2008
## Other three sources(nonpoint,onroad and nonroad) all show that have a significant derease trend from 1999 to 2008
