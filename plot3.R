## define input and output filenames
read.file.name <- "household_power_consumption.txt"
write.file.name <- "plot3.png"

## read data and convert date column to the Date type
power.data <- read.table(read.file.name, header = TRUE, sep = ";", na.strings = "?")
power.data.dates <- as.Date(power.data$Date, format = "%d/%m/%Y")

## subset data between dates
start.date = "2007-02-01"
end.date = "2007-02-02"
filtered.power.data <- power.data[power.data.dates >= start.date
                                  & power.data.dates <= end.date,]
filtered.power.data$Date <- strptime(paste(filtered.power.data$Date,
                                           filtered.power.data$Time),
                                     format = "%d/%m/%Y %H:%M:%S")

## plot and save result
png(write.file.name, width = 480, height = 480, units = "px")
plot(filtered.power.data$Date, filtered.power.data$Sub_metering_1,
     type = "l", col = "black", xlab = "",
     ylab = "Energy sub metering")
points(filtered.power.data$Date, filtered.power.data$Sub_metering_2,
     type = "l", col = "red", xlab = "",
     ylab = "Energy sub metering")
points(filtered.power.data$Date, filtered.power.data$Sub_metering_3,
     type = "l", col = "blue", xlab = "",
     ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()