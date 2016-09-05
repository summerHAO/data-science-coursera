## load data and formate dataset
library(dplyr)
data<- read.csv("activity.csv")
data<-tbl_df(data)
data

##group data with date 
by_date<-group_by(data,date)
by_date
##calculate the total number,mean and medium of steps taken per day
stepsByDay<- summarize(by_date, total=sum(steps))
stepsByDay

meanTotalStepsByDay<- mean(stepsByDay$total,na.rm=TRUE)
meanTotalStepsByDay

medianTotalStepsByDay<- median(stepsByDay$total,na.rm = TRUE)
medianTotalStepsByDay

## make a histogram of the total number of steps taken per day
with(stepsByDay, {    
  barplot(height=stepsByDay$total, names.arg=date, xlab="date", ylim=c(0,25000),
          ylab="# of steps", main = "Number of steps by day", panel.first=grid())
})
abline(h=meanTotalStepsByDay, col="blue")
abline(h=medianTotalStepsByDay, col="red")


##construct a time series of the average number of steps taken per day and measured at each 5-minute interval
by_interval<-group_by(data,interval)
stepsByInterval<- summarize(by_interval,mean=mean(steps,na.rm=TRUE),total=sum(steps,na.rm = TRUE))
stepsByInterval
## make time series plot
with(stepsByInterval, {
  plot(stepsByInterval$interval, stepsByInterval$mean, type="l", xlab="intervals (hours)", ylab="mean of steps", 
       main="Average daily activity pattern", panel.first=grid(), 
       col.axis="white")
  
  # Add minor tick marks
  xMarks <- seq(from = 0, to = 2400, by = 100)
  yMarks <- seq(from = 0, to = 200, by = 50)
  axis(1, at=xMarks, col.axis="blue", las=2, tck=0.02)
  axis(2, at=yMarks, col.axis="blue", las=2, tck=0.02)
  
})

## maximum number of steps
maxSteps <- stepsByInterval$interval[which.max(stepsByInterval$total)]
total

##calculate the total number of missing values 
totMissing <- sum(is.na(data))
totMissing

##filling in all of missing values in the dataset
data$steps_2 <- data$steps   # create a new column of steps derivated from 1st one
nObs <- nrow(data)
iRow <- 1
while(iRow <= nObs) {
  if( is.na(data$steps[iRow]) ) {
    intervalRow <- data$interval[iRow]
    data$steps_2[iRow] = stepsByInterval$mean[which(stepsByInterval$interval==intervalRow)]
  }   
  iRow <- iRow+1
}

##calculate the total number, mean and medium with the missing values dataset
by_date2<-group_by(data,date)
stepsByDay2<- summarize(by_date2, total=sum(steps_2))
stepsByDay2

meanTotalStepsByDay2<- mean(stepsByDay2$total)
meanTotalStepsByDay2

medianTotalStepsByDay2<- median(stepsByDay2$total)
medianTotalStepsByDay2

## make a new historgram
with(stepsByDay2, {    
      barplot(height=stepsByDay2$total, names.arg=date, xlab="date", ylim=c(0,25000),
          ylab="# of steps", main = "Number of steps by day", panel.first=grid())
})
abline(h=meanTotalStepsByDay2, col="blue")
abline(h=medianTotalStepsByDay2, col="red")

##distinguish the weekday and weekend using build a week_period function
typeDay<-c("weekend","weekday")
week_period <- function(v_date) {
  i <- as.POSIXlt(as.Date(v_date))$wday
  return( ifelse(i == 0 || i == 6, typeDay[1], typeDay[2]) )
}
## add new variable for data to sign the day type
data$typeDay <- as.factor( sapply(data$date, week_period) )



par(mfrow=c(2, 1), mar=c(3, 3, 2, 1), oma=c(1.5, 1, 2, 1))

## make a diagram
for(i in typeDay ){
  stepsByTpDay <- aggregate(steps_2 ~ interval, data = data, subset = (data$typeDay == i), FUN = mean)
  plot(stepsByTpDay, type = "l", main = i, xlab="", ylab="", ylim=c(0,250), xlim=c(0,2400), 
       panel.first=grid(), col.axis='white')
  
  xMarks <- seq(from = 0, to = 2400, by = 100)
  axis(1, at=xMarks, col.axis="blue", las=2, tck=0.02)
  yMarks <- seq(from = 0, to = 250, by = 50)
  axis(2, at=yMarks, col.axis="blue", las=2, tck=0.02)
}

mtext( "interval (5-minute)", side=1, outer=TRUE, col="blue", font=1 )  
mtext( "Mean number of steps", side=2, outer=TRUE, col="blue", font=1, cex=0.9 )  
mtext( "Activity patterns between weekdays and weekends", side=3, outer=TRUE, col="maroon", font=2 )  
box("outer", col="maroon") 
mfrow=c(1,1)





