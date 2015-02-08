## Exploratory Data Analysis
## Course Project 1
## plot2

# Read data
filename <- "household_power_consumption.txt"
data5rows <- read.table(filename, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, nrows = 5)
classes   <- sapply(data5rows, class)
data      <- read.table(filename, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, colClasses = classes)

# Prepare data
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Plot
png(file = "plot2.png", bg = "transparent")

plot(data1$datetime, data1$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()