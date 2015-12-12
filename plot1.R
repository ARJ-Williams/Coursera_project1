##########################
# Coursera - Exploratory Data Analysis
# Project 1 - Plot 1
# submitted by - Andrew Williams
#############################

setwd("C:/Users/awilliams3/Training Material/Coursera/Course 4")

######
# read in data files
#####################

data <- read.table("household_power_consumption.txt", header=T, sep=";")
data$Date2 <- as.Date(data$Date, "%d/%m/%Y")

class(data$Date2) # checks date is adate within R

#View(data)

data2 <-subset(data, data$Date2 > "2007-01-31" & data$Date2 < "2007-02-03")
View(data2) # visual check of data

data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
class(data2$Global_active_power)
View(data2)

hist(data2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", 
     cex.lab=0.9, cex.main=0.8, cex.axis=0.8)

# Write to a png file

dev.copy(png, file = "plot1.png") 
dev.off()