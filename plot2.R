#plot2.R

library("sqldf")
library("tcltk2")
#reading and subsetting 1

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile<-"household_power_consumption.txt"
myData <- read.csv.sql(myFile, sql=mySql, sep=";")

#plot2 - Line chart (Global Active Power vs Days

date <-myData$Date
time <-myData$Time

x<-paste(date,time)
x1<-strptime(x, "%d/%m/%Y %H:%M:%S")
myData$date_time <-x1

png(file="plot2.png", width=480, height=480)
par(bg="transparent")
plot(myData$date_time, myData$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab=" ", bg="transparent")
dev.off()
