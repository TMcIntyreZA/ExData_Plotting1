d <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE,)
dim(d)
d[1,]
d2 <- d[d$Date %in% c("1/2/2007","2/2/2007") ,]
dim(d2)

##plot2
dtime <- strptime(paste(d2$Date, d2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(d2$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(dtime, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()