
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
unlink("household_power_consumption.zip")

data <- read.table("household_power_consumption.txt", sep=";",
                   na.strings = "?", header = TRUE)
data$Date = as.Date(data$Date, format="%d/%m/%Y")
data <- data[(data$Date=="2007-02-01" | data$Date=="2007-02-02"),]
data$datetime = as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width=480, height=480)
plot(data$datetime, data$Sub_metering_1,
     type = "n", xlab = "", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_1)
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col = c("black", "red", "blue"))
dev.off()