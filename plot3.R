library(readr)
Sys.setlocale("LC_TIME", "English")
Sys.setenv(LANG = "en")
data_full<-read_csv2("household_power_consumption.txt");
time_full<-strptime(paste(data_full$Date,data_full$Time),"%d/%m/%Y %H:%M:%S");
d1<-strptime("2007-02-01","%Y-%m-%d");
d2<-strptime("2007-02-02","%Y-%m-%d");
data1<-data_full[(trunc(time_full,"day")-d1>=0 & trunc(time_full,"day")-d2<=0),]
time1=strptime(paste(data1$Date,data1$Time),"%d/%m/%Y %H:%M:%S");

with(data1,{
  plot(time1,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(time1,Sub_metering_2,type="l",col="red")
  with(data1,lines(time1,Sub_metering_3,type="l",col="blue"))
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
})

png(filename = "plot3.png")
with(data1,{
  plot(time1,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(time1,Sub_metering_2,type="l",col="red")
  with(data1,lines(time1,Sub_metering_3,type="l",col="blue"))
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
})
dev.off();