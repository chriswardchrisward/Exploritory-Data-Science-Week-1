plot4 <- function(){
  data = read.table("household_power_consumption.txt", header = TRUE, sep=";", dec= ".", na.strings="?")
  mydata = data[data$Date %in% c("1/2/2007", "2/2/2007"),]
  
  TimeDate <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  mydata <- cbind(mydata, TimeDate)
  
  mydata$Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
  mydata$Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
  mydata$Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)
  
  par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0, 0, 2, 0))
  with(mydata, {
    plot(Global_active_power~TimeDate, type="l", ylab="Global Active Power", xlab="")
    plot(TimeDate, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(mydata$TimeDate, mydata$Sub_metering_2,type="l", col= "red")
    lines(mydata$TimeDate, mydata$Sub_metering_3,type="l", col= "blue")
    plot(Voltage~TimeDate, type="l", ylab="Voltage (volt)", xlab="datetime")
    plot(Global_reactive_power~TimeDate, type="l", ylab="Global Reactive Power", xlab="datetime")
    
  })
  dev.copy(png, file="plot4.png", height=480, width=480)
  dev.off()
  
  
}