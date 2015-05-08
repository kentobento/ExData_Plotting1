## define input and output filenames
read.file.name <- "household_power_consumption.txt"
write.file.name <- "plot2.png"

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
plot(filtered.power.data$Date, filtered.power.data$Global_active_power,
     type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()