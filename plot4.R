
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
unlink("household_power_consumption.zip")

data <- read.table("household_power_consumption.txt", sep=";",
                   na.strings = "?", header = TRUE)
data$Date = as.Date(data$Date, format="%d/%m/%Y")
data <- data[(data$Date=="2007-02-01" | data$Date=="2007-02-02"),]
data$datetime = as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(data$datetime, data$Global_active_power,
     type = "l", xlab = "", ylab="Global Active Power")

plot(data$datetime, data$Voltage,
     type = "l", xlab = "datetime", ylab="Voltage")

plot(data$datetime, data$Sub_metering_1,
     type = "l", xlab = "", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col = c("black", "red", "blue"), bty = "n")

plot(data$datetime, data$Global_reactive_power,
     type = "l", xlab = "datetime", ylab="Global_reactive_power")

dev.off()