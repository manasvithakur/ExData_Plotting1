##----Loading the data set
power<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## -------Converting date into 'date' format
power$Date<-as.Date(power$Date,"%d/%m/%Y") 

## Subsetting----
new_power<-power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]

##---Date and time concatenation
datetime <- as.POSIXct(paste(as.Date(new_power$Date), new_power$Time))


## Plot data

globalActivePower <- as.numeric(new_power$Global_active_power)
globalReactivePower <- as.numeric(new_power$Global_reactive_power)
voltage <- as.numeric(new_power$Voltage)

##--Plot

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, new_power$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, new_power$Sub_metering_2, type="l", col="red")
lines(datetime, new_power$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
