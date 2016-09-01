# input the data of household_power_consumption
data<- read.table("C:/Users/summer/Desktop/household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE, dec = ".")

# product the subset data only the date is 2007-02-01 and 2007-02-02
targetDataSet<- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
datatime<- strptime(paste(targetDataSet$Date,targetDataSet$Time,sep = " "),"%d /%m/ %Y %H:%M:%S")
globalActivePower<- as.numeric(targetDataSet$Global_active_power)

# plot2.png
png ("plot2.png",width = 480,height = 480)
plot(datatime,globalActivePower,type = "l",xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()
