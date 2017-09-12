mydata = read.table("household_power_consumption.txt", header = TRUE)
subset = mydata[mydata$Date %in% c("1/2/2007", "2/2/2007"),]
