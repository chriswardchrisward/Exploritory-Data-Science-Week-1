data = read.table("household_power_consumption.txt", header = TRUE, sep=";", dec= ".")
mydata = data[data$Date %in% c("1/2/2007", "2/2/2007"),]
Global_active_power <- as.numeric(as.character(mydata$Global_active_power))
png("plot1.png", width=480, height=480)
hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()