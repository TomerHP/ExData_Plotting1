file<-read.csv("household_power_consumption.txt")
df<-sqldf("select * from file where Date='1/2/2007'OR Date='2/2/2007'")

##Plot 1
df$Global_active_power<-as.numeric(levels(df$Global_active_power))[df$Global_active_power]
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

##Plot 2
