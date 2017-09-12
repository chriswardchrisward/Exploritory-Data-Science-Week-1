plot2 <- function(){
  data = read.table("household_power_consumption.txt", header = TRUE, sep=";", dec= ".", na.strings="?")
  mydata = data[data$Date %in% c("1/2/2007", "2/2/2007"),]
  
  TimeDate <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  mydata <- cbind(mydata, TimeDate)
  
  png("plot2.png", width=480, height=480)
  with(mydata, plot(TimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
  dev.off()
  
}




