## Question 1
## Have total Emissions from PM2.5 decreased in the U.S from 1999 to 2008 ?
## loading data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
## calculate total PM2.5 emissions by year
totalPM2.5<-tapply(NEI$Emissions,NEI$year,sum)
## make the line graph to show the trend
plot(totalPM2.5,x=rownames(totalPM2.5),type="n",axes=FALSE,
     xlab = "Year",ylab="Total PM2.5 Emissions(in tons)",
     main="Total PM2.5 Emissions from 1999 to 2008")
points(totalPM2.5,x=rownames(totalPM2.5),pch=20,col="red")
lines(totalPM2.5,x=rownames(totalPM2.5),col="blue")
axis(2)
axis(side=1,at=seq(1999,2008,by=3))
box()

dev.copy(png,file="Plot1.png")
dev.off()
## The answer is YES