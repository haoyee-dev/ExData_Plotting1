data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", quote="'")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_date <- data[data$Date <= as.Date("2007-02-02"), ]
data_date <- data_date[data_date$Date >= as.Date("2007-02-01"), ]
hist(data_date$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()