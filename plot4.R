data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", quote="'")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_date <- data[data$Date <= as.Date("2007-02-02"), ]
data_date <- data_date[data_date$Date >= as.Date("2007-02-01"), ]
x_axis <- strptime(paste(data_date$Date, data_date$Time), format = "%Y-%m-%d %H:%M:%S")


# top left
plot(x_axis, data_date$Global_active_power, type="l", ylab="Global Active Power", xlab="")

#top right
plot(x_axis, data_date$Voltage, type="l", ylab="Voltage", xlab="datetime")

#bottom left
plot(x_axis, data_date$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(x_axis, data_date$Sub_metering_1, col="black")
lines(x_axis, data_date$Sub_metering_2, col="red")
lines(x_axis, data_date$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid", cex=0.5, bty="n", text.width=60000)

#bottom right
plot(x_axis, data_date$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()