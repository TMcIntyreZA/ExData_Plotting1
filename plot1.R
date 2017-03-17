d <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", dec = ".", stringsAsFactors = FALSE,)
dim(d)
d[1,]
d2 <- d[d$Date %in% c("1/2/2007","2/2/2007") ,]
dim(d2)

##plot 1
gap <- as.numeric(d2$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()