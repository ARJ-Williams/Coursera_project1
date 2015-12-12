########################################
# Coursera - Exploratory Data Analysis #
# Project 1 - Plot 2                   #
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

View(data2) # visual check of data

data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

plot(data2$Date3, data2$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab="", cex.lab=0.9, cex.axis=0.8)
lines(data2$Date3, data2$Global_active_power)

# Write to a png file

dev.copy(png, file = "plot2.png") 
dev.off()

