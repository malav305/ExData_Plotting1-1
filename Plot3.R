data <- read.csv("household_power_consumption.txt", header = T, sep=";", na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
final <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

datetime <- paste(as.Date(final$Date), final$Time)
final$DateTime <- as.POSIXct(datetime)

with(final, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
