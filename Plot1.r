
library(dplyr)

## Read in the data
power_con <- read.csv("power_con.txt.txt", sep=";", stringsAsFactors = FALSE, na.strings="?")

## Get just the dates we need
day1 <- filter(power_con, Date == "1/2/2007")
day2 <- filter(power_con, Date == "2/2/2007")
days <- rbind(day1, day2)

## Plot the data
png(file = "plot1.png", width = 480, height = 480)
hist(days$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()