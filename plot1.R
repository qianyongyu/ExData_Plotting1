library(data.table)

# download and preprocess data
f <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                    "data.zip")
unzip("data.zip", "household_power_consumption.txt")
data <- fread("household_power_consumption.txt", na.strings = c("?"))
in_range <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# plot!
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(in_range$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()