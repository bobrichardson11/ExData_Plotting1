setwd("C:/Users/bobri/OneDrive/Documents/R/ExData_Plotting1")
library(dplyr)

## Read in the data and convert time and date variables from text to appropriate format

power_con <- read.csv("power_con.txt.txt", sep=";", stringsAsFactors = FALSE, na.strings="?")
power_small <- subset(power_con, power_con$Date=="1/2/2007" | power_con$Date=="2/2/2007")

power_small$Time <- strptime(power_small$Time, format="%H:%M:%S")
power_small$Date <- as.Date(power_small$Date, format = "%d/%m/%Y")

## Plot the data
png(file = "plot3.png", width = 480, height = 480)
plot(power_small$Time,power_small$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(power_small,lines(Time, as.numeric(as.character(Sub_metering_1))))
with(power_small,lines(Time, as.numeric(as.character(Sub_metering_2)), col = "red"))
with(power_small,lines(Time, as.numeric(as.character(Sub_metering_3)), col = "blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main = "Energy Sub Metering")
dev.off()