#load the data for plotting
power <- read.delim("household_power_consumption.txt",sep=";",header=TRUE)
head(power)

#subset the data from the correct dates
power$Date2 <- as.Date(power$Date,format="%d/%m/%Y")
power2 <- power[power$Date2 >= "2007-02-01" & power$Date2 <= "2007-02-02",]

#convert the dates and times for plotting
power2$datetime <- strptime(paste(power2$Date2, power2$Time),format="%Y-%m-%d %H:%M:%S")

#plot lines
png("plot2.png",height=480,width=480)
plot(power2$datetime,as.numeric(as.character(power2$Global_active_power)),
     type="l",col="black",ylab="Global Active Power (kilowatts)",main="",xlab="")
dev.off()

