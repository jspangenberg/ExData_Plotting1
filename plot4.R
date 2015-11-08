powerConsumption <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")
# Add an extra column for converted date and time values to Date/Time values 
powerConsumption$dateTime <- strptime(paste(powerConsumption$Date, sep=', ', powerConsumption$Time), format='%d/%m/%Y, %H:%M:%S')
#Only use data from the dates 2007-02-01 and 2007-02-02
febPC <-  subset(powerConsumption, (as.Date(powerConsumption$dateTime) == "2007-02-01") | (as.Date(powerConsumption$dateTime) == "2007-02-02"))

par(mar=c(4,4,2,2))
par(mfrow=c(2,2))

plot(febPC$dateTime, as.numeric(febPC$Global_active_power) / 1000, type="l", ylab = "Global Active Power", xlab="")
plot(febPC$dateTime, febPC$Voltage, type="l", ylab = "Voltage", xlab="datetime")

plot(febPC$dateTime, febPC$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab="")
legend("topright", fill=NULL, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), pch = "_", )
points(febPC$dateTime,febPC$Sub_metering_1, type="l")
points(febPC$dateTime,febPC$Sub_metering_2, type="l", col="red")
points(febPC$dateTime,febPC$Sub_metering_3, type="l", col="blue")

plot(febPC$dateTime, febPC$Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime")


dev.copy(png, file = "./plot4.png")
dev.off()