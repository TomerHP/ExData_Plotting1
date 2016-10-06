file<-read.csv("household_power_consumption.txt")
df<-sqldf("select * from file where Date='1/2/2007'OR Date='2/2/2007'")
