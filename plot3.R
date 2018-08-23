library(lubridate)
par(mfcol=c(1,1))

## plot 3
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)
data2<-data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]
data2$Global_active_power<-as.numeric(data2$Global_active_power)
data2$dayname<-wday(data2$Date,label=TRUE)


plot.ts(data2$Sub_metering_1,ylab="Energy sub metering",xaxt="n",yaxt="n",xlab=NULL)
lines(data2$Sub_metering_2,col="red")
lines(data2$Sub_metering_3,col="blue")

axis(1,at=c("0",NROW(data2$Date)/2,NROW(data2$Date)),labels=c(as.character(data2$dayname[1]),as.character(data2$dayname[NROW(data2$Date)]),as.character(wday(data2$Date[NROW(data2$Date)]+1,label=TRUE))),xlab="")
axis(2,at=c(0,10,20,30))
legend("topright",legend=names(data2[7:9]),col=c(1:3),lty=1)

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()