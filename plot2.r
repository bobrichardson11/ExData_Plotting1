setwd("C:/Users/bobri/coursera/Exploratory")
library(dplyr)

## Read in the data and convert time and date variables from text to appropriate format

power_con <- read.csv("power_con.txt.txt", sep=";", stringsAsFactors = FALSE, na.strings="?")
power_small <- subset(power_con, power_con$Date=="1/2/2007" | power_con$Date=="2/2/2007")

power_small$Time <- strptime(power_small$Time, format="%H:%M:%S")
power_small$Date <- as.Date(power_small$Date, format = "%d/%m/%Y")


## Plot the data

png(file = "plot2.png", width = 480, height = 480)

with(power_small, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))

dev.off()
