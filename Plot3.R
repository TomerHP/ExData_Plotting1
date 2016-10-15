##Load the complete file
file<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,sep = ";",na.strings = "?")
library(sqldf)
##filter only the relevant dates into df dataframe
df<-sqldf("select * from file where Date='1/2/2007'OR Date='2/2/2007'")

png(filename="plot3.png")
##Plot 3
plot(df$Full_Time,df$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(df$Full_Time,df$Sub_metering_2,col="red")
lines(df$Full_Time,df$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col = c("black","red","blue"))

#Close Device
dev.off()