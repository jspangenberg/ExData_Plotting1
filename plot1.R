powerConsumption <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")
# Add an extra column for converted date and time values to Date/Time values 
powerConsumption$dateTime <- strptime(paste(powerConsumption$Date, sep=', ', powerConsumption$Time), format='%d/%m/%Y, %H:%M:%S')
#Only use data from the dates 2007-02-01 and 2007-02-02
febPC <-  subset(powerConsumption, (as.Date(powerConsumption$dateTime) == "2007-02-01") | (as.Date(powerConsumption$dateTime) == "2007-02-02"))

hist(as.numeric(febPC$Global_active_power) / 1000, col="red", main=paste("Global Active Power"), xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "./plot1.png")
dev.off()