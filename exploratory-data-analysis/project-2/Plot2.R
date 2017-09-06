## Question 2
## Have total emissions from PM2.5 decreased in the Baltimore City from 1999 to 2008 ? 
## loading data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
## subset1 is Baltimore city's NEI
subset1<-NEI[NEI$fips=="24510",]
subset1.totalPM2.5<-tapply(subset1$Emissions,subset1$year,sum)
## make the line graph to show the trend
plot(subset1.totalPM2.5,x=rownames(subset1.totalPM2.5),type="n",axes=FALSE,
     xlab = "Year",ylab="Total PM2.5 Emissions(in tons)",
     main="Total PM2.5 Emissions from 1999 to 2008 in the Baltimore city")
points(subset1.totalPM2.5,x=rownames(subset1.totalPM2.5),pch=20,col="red")
lines(subset1.totalPM2.5,x=rownames(subset1.totalPM2.5),col="blue")
axis(2)
axis(side=1,at=seq(1999,2008,by=3))
box()

dev.copy(png,file="Plot2.png")
dev.off()
## The answer is YES