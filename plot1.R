library(readr)
data_full<-read_csv2("household_power_consumption.txt");
time_full<-strptime(paste(data_full$Date,data_full$Time),"%d/%m/%Y %H:%M:%S");
d1<-strptime("2007-02-01","%Y-%m-%d");
d2<-strptime("2007-02-02","%Y-%m-%d");
data1<-data_full[(trunc(time_full,"day")-d1>=0 & trunc(time_full,"day")-d2<=0),]
with(data1,hist(Global_active_power,col="red",main="Global active power",xlab="Global Active Power (kilowatts)"))
dev.copy(png, file = "plot1.png");
dev.off();