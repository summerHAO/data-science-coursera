# input the data of household_power_consumption
data<- read.table("C:/Users/summer/Desktop/household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE, dec = ".")

# product the subset data only the date is 2007-02-01 and 2007-02-02
targetDataSet<- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
datatime<- strptime(paste(targetDataSet$Date,targetDataSet$Time,sep = " "),"%d /%m/ %Y %H:%M:%S")
globalActivePower<- as.numeric(targetDataSet$Global_active_power)

subMetering1<- as.numeric(targetDataSet$Sub_metering_1)
subMetering2<- as.numeric(targetDataSet$Sub_metering_2)
subMetering3<- as.numeric(targetDataSet$Sub_metering_3)

#plot3.png
png("plot3.png",width = 480,height = 480)
plot(datatime,subMetering1,type = "l",ylab = "Energy Submetering",xlab=" ")
lines(datatime,subMetering2,type = "l",col="red")
lines(datatime,subMetering3,type = "l",col="blue")

legend("topright",c("Sub_metering-1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2.5,col =c("black","red","blue"))
dev.off()
