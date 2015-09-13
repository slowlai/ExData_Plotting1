library(readr)
Sys.setlocale("LC_TIME", "English")
Sys.setenv(LANG = "en")
data_full<-read_csv2("household_power_consumption.txt");
time_full<-strptime(paste(data_full$Date,data_full$Time),"%d/%m/%Y %H:%M:%S");
d1<-strptime("2007-02-01","%Y-%m-%d");
d2<-strptime("2007-02-02","%Y-%m-%d");
data1<-data_full[(trunc(time_full,"day")-d1>=0 & trunc(time_full,"day")-d2<=0),]
time1=strptime(paste(data1$Date,data1$Time),"%d/%m/%Y %H:%M:%S");

par(mfrow=c(2,2));

with(data1,{
  plot(time1,Global_active_power,type="l",xlab="",ylab="Global active power (kilowatts)")
  plot(time1,Voltage,type="l",xlab="",ylab="Voltage")
  plot(time1,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(time1,Sub_metering_2,type="l",col="red")
  lines(time1,Sub_metering_3,type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.6)
  plot(time1,Global_reactive_power,type="l",xlab="",ylab="Global reactive power (kilowatts)")
})
par(mfrow=c(1,1))

png(filename = "plot4.png")
par(mfrow=c(2,2));

with(data1,{
  plot(time1,Global_active_power,type="l",xlab="",ylab="Global active power (kilowatts)")
  plot(time1,Voltage,type="l",xlab="",ylab="Voltage")
  plot(time1,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(time1,Sub_metering_2,type="l",col="red")
  lines(time1,Sub_metering_3,type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
  plot(time1,Global_reactive_power,type="l",xlab="",ylab="Global reactive power (kilowatts)")
})


dev.off();
