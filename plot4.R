#load the data for plotting
power <- read.delim("household_power_consumption.txt",sep=";",header=TRUE)
head(power)

#subset the data from the correct dates
power$Date2 <- as.Date(power$Date,format="%d/%m/%Y")
power2 <- power[power$Date2 >= "2007-02-01" & power$Date2 <= "2007-02-02",]

#convert the dates and times for plotting
power2$datetime <- strptime(paste(power2$Date2, power2$Time),format="%Y-%m-%d %H:%M:%S")

#4 plots
png("plot4.png",height=480,width=480)
par(mfrow=c(2,2))
plot(power2$datetime,as.numeric(as.character(power2$Global_active_power)),
     type="l",col="black",ylab="Global Active Power (kilowatts)",main="",xlab="")

plot(power2$datetime,as.numeric(as.character(power2$Voltage)),
     type="l",col="black",ylab="Voltage",main="",xlab="datetime")

plot(power2$datetime,as.numeric(as.character(power2$Sub_metering_1)),
     type="l",col="black",ylab="Energy sub metering",main="",xlab="")
lines(power2$datetime,as.numeric(as.character(power2$Sub_metering_2)),
     type="l",col="red")
lines(power2$datetime,as.numeric(as.character(power2$Sub_metering_3)),
      type="l",col="blue")
legend("topright",legend=names(power2)[7:9],col=c("black","red","blue"),lty=1)

plot(power2$datetime,as.numeric(as.character(power2$Global_reactive_power)),
     type="l",col="black",ylab="Global_reactive_power",main="",xlab="datetime")

dev.off()

