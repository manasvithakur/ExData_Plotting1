##----Loading the data set
power<- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE)

## -------Converting date into date format

power$Date<-as.Date(power$Date,"%d/%m/%Y") #converting date col to date fromat

## Subsetting----
new_power<-power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]

##---Date and time concatenation

datetime <- as.POSIXct(paste(as.Date(new_power$Date), new_power$Time))

##---plotting

data2 <- as.numeric(new_power$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime,data2,type = "l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
