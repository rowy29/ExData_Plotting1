power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
power_subset <- power[which(power$Date=="1/2/2007" | power$Date=="2/2/2007"),]
power_subset <-transform(power_subset, Date = as.Date(Date, format = "%d/%m/%Y"))
power_subset$DateTime = paste(power_subset$Date, power_subset$Time)
power_subset<-transform(power_subset, DateTime = strptime(DateTime, format="%Y-%m-%d %H:%M:%S"))
png("plot1.png", width=480, height=480, units="px")
hist(power_subset$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()