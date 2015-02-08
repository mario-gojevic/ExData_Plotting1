## Exploratory Data Analysis
## Course Project 1
## plot3

# Read data
filename <- "household_power_consumption.txt"
data5rows <- read.table(filename, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, nrows = 5)
classes   <- sapply(data5rows, class)
data      <- read.table(filename, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, colClasses = classes)

# Prepare data
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Plot
png(file = "plot3.png")

plot(data1$datetime, data1$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")

lines(data1$datetime, data1$Sub_metering_2, col = "red")
lines(data1$datetime, data1$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

dev.off()