#plot3.R

library("sqldf")
library("tcltk2")
#reading and subsetting 1

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile<-"household_power_consumption.txt"
myData <- read.csv.sql(myFile, sql=mySql, sep=";")

#plot3 - Line chart (Sub meters vs Days
date <-myData$Date
time <-myData$Time

x<-paste(date,time)
x1<-strptime(x, "%d/%m/%Y %H:%M:%S")
myData$date_time <-x1

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2), bg="transparent")

plot(myData$date_time, myData$Global_active_power, type="l", ylab="Global Active Power", xlab=" ")

plot(myData$date_time, myData$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(myData$date_time, myData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=" ")
lines(myData$date_time, myData$Sub_metering_2, type="l", col="red")
lines(myData$date_time, myData$Sub_metering_3, type="l", col="blue")
legend("topright", cex=0.7, pt.cex=cex, lty=1, col=c("black","red","blue"), bty="n", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_2"))

plot(myData$date_time, myData$Global_reactive_power, type="l", ylab="Global_active_power", xlab="datetime")
dev.off()
