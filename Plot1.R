
##----Loading the data set
power<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## -------Converting date into 'date' format
power$Date<-as.Date(power$Date,"%d/%m/%Y") #converting date col to date fromat
rm(power)
## Subsetting----
new_power<-power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]

##----Creating the plot and saving as .png

globalActivePower <- as.numeric(new_power$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


