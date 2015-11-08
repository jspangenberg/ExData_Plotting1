powerConsumption <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")
# Add an extra column for converted date and time values to Date/Time values 
powerConsumption$dateTime <- strptime(paste(powerConsumption$Date, sep=', ', powerConsumption$Time), format='%d/%m/%Y, %H:%M:%S')
#Only use data from the dates 2007-02-01 and 2007-02-02
febPC <-  subset(powerConsumption, (as.Date(powerConsumption$dateTime) == "2007-02-01") | (as.Date(powerConsumption$dateTime) == "2007-02-02"))

plot(febPC$dateTime, as.numeric(febPC$Global_active_power) / 1000, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

dev.copy(png, file = "./plot2.png")
dev.off()