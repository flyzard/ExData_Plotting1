source("helpers.R")

# Set png with and height to 480px
png("plot2.png", width=480, height=480)
global_active_power = as.numeric(dataset$Global_active_power)

datetime <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Build plot
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Print plot to file
dev.off()
