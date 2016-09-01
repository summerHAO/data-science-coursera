# input the data of household_power_consumption
data<- read.table("C:/Users/summer/Desktop/household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE, dec = ".")

# product the subset data only the date is 2007-02-01 and 2007-02-02
targetDataSet<- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

datatime<- strptime(paste(targetDataSet$Date,targetDataSet$Time,sep = " "),"%d /%m/ %Y %H:%M:%S")

globalActivePower<- as.numeric(targetDataSet$Global_active_power)
globalReactivePower<- as.numeric(targetDataSet$Global_reactive_power)

voltage<- as.numeric(targetDataSet$Voltage)
subMetering1<- as.numeric(targetDataSet$Sub_metering_1)
subMetering2<- as.numeric(targetDataSet$Sub_metering_2)
subMetering3<- as.numeric(targetDataSet$Sub_metering_3)

png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))

plot(datatime,globalActivePower,type = "l",xlab = " ",ylab ="Global Active Power",cex=0.2 )

plot(datatime,globalReactivePower,type = "l",xlab = "datatime",ylab = "Voltage")

plot(datatime,subMetering1,type = "l",ylab = "Energy Submetering",xlab=" ")


lines(datatime,subMetering2,type = "l",col="red")
lines(datatime,subMetering3,type = "l",col="blue")

legend("topright",c("Sub_metering-1","Sub_metering_2","Sub_metering_3"),lty = ,lwd = 2.5,col =c("black","red","blue"),bty="o")

plot(datatime,globalReactivePower,type = "l",xlab = "datatime",ylab = "Global_reactice_power")
dev.off()
