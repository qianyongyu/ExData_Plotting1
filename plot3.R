library(data.table)

# download and preprocess data
f <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                   "data.zip")
unzip("data.zip", "household_power_consumption.txt")
data <- fread("household_power_consumption.txt", na.strings = c("?"))
in_range <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
dates <- strptime(paste(in_range$Date, in_range$Time), format = "%d/%m/%Y %H:%M:%S")

# plot!
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(in_range, plot(dates, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
points(x = dates, y = in_range$Sub_metering_2, type = "l", col = "red")
points(x = dates, y = in_range$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col = c("black", "red", "blue"),
        lty = 1)
dev.off()