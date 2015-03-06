#load the data for plotting
power <- read.delim("household_power_consumption.txt",sep=";",header=TRUE)
head(power)

#subset the data from the correct dates
power$Date2 <- as.Date(power$Date,format="%d/%m/%Y")
power2 <- power[power$Date2 >= "2007-02-01" & power$Date2 <= "2007-02-02",]

#plot histogram
png("plot1.png",height=480,width=480)
hist(as.numeric(as.character(power2$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

