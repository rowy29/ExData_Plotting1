power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
power_subset <- power[which(power$Date=="1/2/2007" | power$Date=="2/2/2007"),]
power_subset <-transform(power_subset, Date = as.Date(Date, format = "%d/%m/%Y"))
power_subset$DateTime = paste(power_subset$Date, power_subset$Time)
power_subset<-transform(power_subset, DateTime = strptime(DateTime, format="%Y-%m-%d %H:%M:%S"))
png("plot3.png", width=480, height=480, units="px")
plot(power_subset$DateTime, power_subset$Sub_metering_1, col="black", type="l", ylab="Energy sub metering", xlab="")
lines(x=power_subset$DateTime, y=power_subset$Sub_metering_2, col="red")
lines(x=power_subset$DateTime, y=power_subset$Sub_metering_3, col="blue")
legend("topright", lty="solid", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()