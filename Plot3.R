##----Loading the data set
power<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## -------Converting date into 'date' format
power$Date<-as.Date(power$Date,"%d/%m/%Y")

## Subsetting----
new_power<-power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]
rm(power)
##---Date and time concatenation
datetime <- as.POSIXct(paste(as.Date(new_power$Date), new_power$Time))

##---Plot
png("plot3.png", width=480, height=480)
plot(datetime, new_power$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, new_power$Sub_metering_2, type="l", col="red")
lines(datetime, new_power$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()