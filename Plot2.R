data <- read.csv("household_power_consumption.txt", header = T, sep=";", na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
final <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

datetime <- paste(as.Date(final$Date), final$Time)
final$DateTime <- as.POSIXct(datetime)

plot(final$Global_active_power~final$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
