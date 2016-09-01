# input the data of household_power_consumption
data<- read.table("C:/Users/summer/Desktop/household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE, dec = ".")

# product the subset data only the date is 2007-02-01 and 2007-02-02
targetDataSet<- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
globalActivePower<- as.numeric(targetDataSet$Global_active_power)

# plot1.png
png ("plot1.png",width = 480,height = 480)
hist(globalActivePower,col="red",main= "Global Active Power",xlab = "Global Active Power(kilowatts)")
dev.off()
