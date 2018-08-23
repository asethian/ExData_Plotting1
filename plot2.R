library(lubridate)
par(mfcol=c(1,1))

## plot 2
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)
data2<-data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]
data2$Global_active_power<-as.numeric(data2$Global_active_power)
data2$dayname<-wday(data2$Date,label=TRUE)


plot.ts(data2$Global_active_power/500,ylab="Global Active Power (kilowatts)",xaxt="n",xlab=NULL)

axis(1,at=c("0",NROW(data2$Date)/2,NROW(data2$Date)),labels=c(as.character(data2$dayname[1]),as.character(data2$dayname[NROW(data2$Date)]),as.character(wday(data2$Date[NROW(data2$Date)]+1,label=TRUE))))

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()