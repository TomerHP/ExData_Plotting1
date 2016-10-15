##Load the complete file
file<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,sep = ";",na.strings = "?")
library(sqldf)
##filter only the relevant dates into df dataframe
df<-sqldf("select * from file where Date='1/2/2007'OR Date='2/2/2007'")

##Plot 2
png(filename="plot2.png")

df[["Full_Time"]]<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M")  ##Merge Date and Time into 1 Time variable
plot(df$Full_Time,df$Global_active_power,type="l")

#Close Device
dev.off()