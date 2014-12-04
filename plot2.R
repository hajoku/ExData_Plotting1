hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings=c("NA", "-", "?"))
hpc2 = hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]
hpc2$DateTime <- paste(hpc2$Date, hpc2$Time)
hpc2$DateTime <- strptime(hpc2$DateTime, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
png("plot2.png")
plot(hpc2$DateTime, hpc2$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()