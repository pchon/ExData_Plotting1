%#plot1.R
library("sqldf")
library("tcltk2")
#reading and subsetting 1

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile<-"household_power_consumption.txt"
dates <- read.csv2.sql(myFile,mySql)


#reading and subsetting 2
datafull<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
data<-datafull

data$Date<-as.Date(data$Date, "%d/%m/%Y")

#date is a factor
dates<-subset(datafull, Date =="1/2/2007" | Date=="2/2/2007")

#date is Date - unresolved
dates<-data[which(data$Date %in% c("2007-02-01", "2007-02-02")),]
dates<-data[which(data$Date %in% c('2007-02-01', '2007-02-02')),]

dates<-data[(data$Date>'2007-02-01' & data$Date<'2007-02-02'),]


#plot1 - Histogram Global_active_power
par(bg="transparent")
GAP <-as.numeric(as.character(dates$Global_active_power))

png(file="plot1.png", width=480, height=480)
par(bg="transparent")
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")
dev.off()



