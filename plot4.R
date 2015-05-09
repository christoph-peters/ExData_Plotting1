data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings='?')
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
sub_data<-subset(data, as.Date(DateTime)>=as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

# Make subplots
par(mfrow=c(2,2))

# First plot
plot(sub_data$DateTime, sub_data$Global_active_power, type="n", xlab = "", ylab = "Global Active Power")
lines(sub_data$DateTime, sub_data$Global_active_power, type="l", col="black")

# Second plot
plot(sub_data$DateTime, sub_data$Voltage, type="n", xlab = "datetime", ylab = "Voltage")
lines(sub_data$DateTime, sub_data$Voltage, type="l", col="black")

# Third plot
plot(sub_data$DateTime, sub_data$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
lines(sub_data$DateTime, sub_data$Sub_metering_1, type="l", col="black")
lines(sub_data$DateTime, sub_data$Sub_metering_2, type="l", col = "red")
lines(sub_data$DateTime, sub_data$Sub_metering_3, type="l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1),lwd=c(2.5,2.5))

# Fourth plot
plot(sub_data$DateTime, sub_data$Global_reactive_power, type="n", xlab = "datetime", ylab = "Global Reactive Power")
lines(sub_data$DateTime, sub_data$Global_reactive_power, type="l", col="black")

dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()