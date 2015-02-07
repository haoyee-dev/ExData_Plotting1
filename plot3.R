data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", quote="'")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_date <- data[data$Date <= as.Date("2007-02-02"), ]
data_date <- data_date[data_date$Date >= as.Date("2007-02-01"), ]
x_axis <- strptime(paste(data_date$Date, data_date$Time), format = "%Y-%m-%d %H:%M:%S")
plot(x_axis, data_date$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(x_axis, data_date$Sub_metering_1, col="black")
lines(x_axis, data_date$Sub_metering_2, col="red")
lines(x_axis, data_date$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid", cex=0.5, text.width= 30000)
dev.copy(png, file="plot3.png", width=480, height=480)