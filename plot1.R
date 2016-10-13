file<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,sep = ";")
df<-sqldf("select * from file where Date='1/2/2007'OR Date='2/2/2007'")

##Plot 1
df$Global_active_power<-as.numeric(df$Global_active_power)
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

##Plot 2
df[["Full_Time"]]<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M")
plot(df$Full_Time,df$Global_active_power,type="l")


