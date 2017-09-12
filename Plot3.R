plot3 <- function(){

  data = read.table("household_power_consumption.txt", header = TRUE, sep=";", dec= ".", na.strings="?")
  mydata = data[data$Date %in% c("1/2/2007", "2/2/2007"),]

  TimeDate <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  mydata <- cbind(mydata, TimeDate)

  mydata$Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
  mydata$Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
  mydata$Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)

  png("plot3.png", width=480, height=480)
  with(mydata, plot(TimeDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
  lines(mydata$TimeDate, mydata$Sub_metering_2,type="l", col= "red")
  lines(mydata$TimeDate, mydata$Sub_metering_3,type="l", col= "blue")
  
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col = c("black", "red", "blue"))

  dev.off()

}
