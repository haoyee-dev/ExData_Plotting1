data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", quote="'")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_date <- data[data$Date <= as.Date("2007-02-02"), ]
data_date <- data_date[data_date$Date >= as.Date("2007-02-01"), ]
plot(strptime(paste(data_date$Date, data_date$Time), format = "%Y-%m-%d %H:%M:%S"), data_date$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()