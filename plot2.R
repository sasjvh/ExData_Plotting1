# Assumes data file https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# was downloaded and unzipped in the working directory
require(data.table)
power <- fread("household_power_consumption.txt", na.strings = "?") # recognize ? as an NA
power <- subset(power, Date %in% c("1/2/2007", "2/2/2007")) # limit data to Feb 1 and 2nd, 2007
power$DateTime <- as.POSIXct(strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")) # Create date time fields
# Open png device
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
plot(power$DateTime, power$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA)
dev.off()