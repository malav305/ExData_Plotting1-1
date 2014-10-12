data <- read.csv("household_power_consumption.txt", header = T, sep=";", na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
final <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

datetime <- paste(as.Date(final$Date), final$Time)
final$DateTime <- as.POSIXct(datetime)

hist(final$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
