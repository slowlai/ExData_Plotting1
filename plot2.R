library(readr)
Sys.setlocale("LC_TIME", "English")
Sys.setenv(LANG = "en")
data_full<-read_csv2("household_power_consumption.txt");
time_full<-strptime(paste(data_full$Date,data_full$Time),"%d/%m/%Y %H:%M:%S");
d1<-strptime("2007-02-01","%Y-%m-%d");
d2<-strptime("2007-02-02","%Y-%m-%d");
data1<-data_full[(trunc(time_full,"day")-d1>=0 & trunc(time_full,"day")-d2<=0),]
time1=strptime(paste(data1$Date,data1$Time),"%d/%m/%Y %H:%M:%S");

with(data1,plot(time1,Global_active_power,type="l",xlab="",ylab="Global active power (kilowatts)"))

dev.copy(png, file = "plot2.png");
dev.off();