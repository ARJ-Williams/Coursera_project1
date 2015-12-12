########################################
# Coursera - Exploratory Data Analysis #
# Project 1 - Plot 4                   #
# submitted by - Andrew Williams       #
########################################

setwd("C:/Users/awilliams3/Training Material/Coursera/Course 4")

######################
# read in data files #
######################

data <- read.table("household_power_consumption.txt", header=T, sep=";")
data$Date2 <- as.Date(data$Date, "%d/%m/%Y")

class(data$Date2) # checks date is a date within R

data2 <-subset(data, data$Date2 > "2007-01-31" & data$Date2 < "2007-02-03")
data2$Date3 <- paste(data2$Date, data2$Time)
data2$Date3 <- strptime(data2$Date3, "%d/%m/%Y %H:%M:%S")

####
# prepare & clean data
##########

data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))
data2$Voltage <- as.numeric(as.character(data2$Voltage))
data2$Global_reactive_power <- as.numeric(as.character(data2$Global_reactive_power))

View(data2)

par(mfcol = c(2, 2))

# plot 1

plot(data2$Date3, data2$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab="", cex.lab=0.8, cex.axis=0.8)
lines(data2$Date3, data2$Global_active_power)

# plot 2

plot(data2$Date3, data2$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab="", cex.lab=0.8, cex.axis=0.8)
lines(data2$Date3, data2$Sub_metering_1, col = "black")
lines(data2$Date3, data2$Sub_metering_2, col = "red")
lines(data2$Date3, data2$Sub_metering_3, col = "blue")
legend("topright", cex=0.8,  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lty = c(1, 1, 1))

# plot 3

plot(data2$Date3, data2$Voltage, type = "n", ylab = "Voltage", xlab="datetime", cex.lab=0.8, cex.axis=0.8)
lines(data2$Date3, data2$Voltage)

# plot 4

plot(data2$Date3, data2$Global_reactive_power,, type = "n", ylab = "Global_reactive_power", xlab="datetime", cex.lab=0.8, cex.axis=0.8)
lines(data2$Date3, data2$Global_reactive_power)

# Write to a png file

dev.copy(png, file = "plot4.png") 
dev.off()
