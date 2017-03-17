d <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE,)
dim(d)
d[1,]
d2 <- d[d$Date %in% c("1/2/2007","2/2/2007") ,]
dim(d2)

##plot3
dtime <- strptime(paste(d2$Date, d2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submet1 <- as.numeric(d2$Sub_metering_1)
submet2 <- as.numeric(d2$Sub_metering_2)
submet3 <- as.numeric(d2$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(dtime, submet1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(dtime, submet2, type = "l", col = "red")
lines(dtime, submet3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()