hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings=c("NA", "-", "?"))
hpc2 = hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]
hpc2$DateTime <- paste(hpc2$Date, hpc2$Time)
hpc2$DateTime <- lapply(hpc2$DateTime, FUN = function(x) {strptime(x, "%d/%m/%Y %H:%M:%S")})
png("plot1.png")
hist(hpc2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()