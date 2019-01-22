source("helpers.R")

# Set png with and height to 480px
png("plot1.png", width=480, height=480)
global_active_power = as.numeric(dataset$Global_active_power)

# Build plot with histogram
hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# Print plot to file
dev.off()
