## define input and output filenames
read.file.name <- "household_power_consumption.txt"
write.file.name <- "plot1.png"

## read data and convert date column to the Date type
power.data <- read.table(read.file.name, header = TRUE, sep = ";", na.strings = "?")
power.data$Date <- as.Date(power.data$Date, format = "%d/%m/%Y")

## subset data between dates
start.date = "2007-02-01"
end.date = "2007-02-02"
filtered.power.data <- power.data[power.data$Date >= start.date
                                  & power.data$Date <= end.date,]

## plot and save result
png(write.file.name, width = 480, height = 480, units = "px")
hist(filtered.power.data$Global_active_power, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()