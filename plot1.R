library(lubridate)
par(mfcol=c(1,1))

## plot 1
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)
data2<-data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]
data2$Global_active_power<-as.numeric(data2$Global_active_power)
hist(data2$Global_active_power/500,ylim=c(0,1200),xaxt="n",col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency", main="Global Active Power")
axis(1,at=c(0,2,4,6))

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
