powerConsumption <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")
# Add an extra column for converted date and time values to Date/Time values 
powerConsumption$dateTime <- strptime(paste(powerConsumption$Date, sep=', ', powerConsumption$Time), format='%d/%m/%Y, %H:%M:%S')
#Only use data from the dates 2007-02-01 and 2007-02-02
febPC <-  subset(powerConsumption, (as.Date(powerConsumption$dateTime) == "2007-02-01") | (as.Date(powerConsumption$dateTime) == "2007-02-02"))

plot(febPC$dateTime, febPC$Sub_metering_1, type="n")
plot(febPC$dateTime, febPC$Sub_metering_2, type="n")
plot(febPC$dateTime, febPC$Sub_metering_3, type="n", ylab = "Energy sub metering", xlab="")
par(mar=c(1,4,1,1))

legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

points(febPC$dateTime,febPC$Sub_metering_1, type="l")
points(febPC$dateTime,febPC$Sub_metering_2, type="l", col="red")
points(febPC$dateTime,febPC$Sub_metering_3, type="l", col="blue")

dev.copy(png, file = "./plot3.png")
dev.off()