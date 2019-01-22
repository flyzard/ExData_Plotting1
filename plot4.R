source("helpers.R")

# Set png with and height to 480px
png("plot4.png", width=480, height=480)
global_active_power = as.numeric(dataset$Global_active_power)

# Initiate variable to print
datetime <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_metering1 <- as.numeric(dataset$Sub_metering_1)
sub_metering2 <- as.numeric(dataset$Sub_metering_2)
sub_metering3 <- as.numeric(dataset$Sub_metering_3)
global_reactive_power <- as.numeric(dataset$Global_reactive_power)
voltage <- as.numeric(dataset$Voltage)

# Set graphical params to show graph in two collumns and two lines
par(mfrow = c(2, 2)) 

# Build plot
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering2, type="l", col="red")
lines(datetime, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# Print plot to file
dev.off()
