##Load the complete file
file<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,sep = ";",na.strings = "?")
library(sqldf)
##filter only the relevant dates into df dataframe
df<-sqldf("select * from file where Date='1/2/2007'OR Date='2/2/2007'")

##Plot 1
df$Global_active_power<-as.numeric(df$Global_active_power)
png(filename="plot1.png")
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

#Close device
dev.off()