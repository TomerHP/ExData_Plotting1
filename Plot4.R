##Load the complete file
file<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,sep = ";",na.strings = "?")
library(sqldf)
##filter only the relevant dates into df dataframe
df<-sqldf("select * from file where Date='1/2/2007'OR Date='2/2/2007'")

png(filename="plot4.png")
##Plot 4
par(mfrow=c(2,2)) 
#1
plot(df$Full_Time,df$Global_active_power,type="l",ylab="Global Active Power",xlab="")
#2          
plot(df$Full_Time,df$Voltage,type="l",ylab="Voltage",xlab="datetime")
#3  note that the legened is not alligned properly in R Studio, only in R.exe 
plot(df$Full_Time,df$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(df$Full_Time,df$Sub_metering_2,col="red")
lines(df$Full_Time,df$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))
#4
plot(df$Full_Time,df$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

#Close Device
dev.off()