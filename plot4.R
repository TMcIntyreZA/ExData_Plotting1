d <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", dec = ".", stringsAsFactors = FALSE,)
dim(d)
d[1,]
d2 <- d[d$Date %in% c("1/2/2007","2/2/2007") ,]
dim(d2)

##plot 4
dtime <- strptime(paste(d2$Date, d2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(d2$Global_active_power)
grp <- as.numeric(d2$Global_reactive_power)
submet1 <- as.numeric(d2$Sub_metering_1)
submet2 <- as.numeric(d2$Sub_metering_2)
submet3 <- as.numeric(d2$Sub_metering_3)
volt <- as.numeric(d2$Voltage)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
##subplot1
plot(dtime, gap, type = "l", xlab = "", ylab = "Global Active Power", cex.lab = 0.75, cex.axis = 0.75, cex = 0.2)
##subplot2
plot(dtime, volt, type = "l", xlab = "datetime", ylab = "Voltage", cex.lab = 0.75, cex.axis = 0.75)
##subplot3
plot(dtime, submet1, type = "l", ylab = "Energy sub metering", col = "black", xlab = "", cex.lab = 0.75, cex.axis = 0.75)
lines(dtime, submet2, type = "l", col = "red")
lines(dtime, submet3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, , cex = 0.7, col = c("black", "red", "blue"), bty = "n")
##subplot4
plot(dtime, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex.lab = 0.75, cex.axis = 0.75)
dev.off()