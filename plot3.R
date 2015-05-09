data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings='?')
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
sub_data<-subset(data, as.Date(DateTime)>=as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

plot(sub_data$DateTime, sub_data$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
lines(sub_data$DateTime, sub_data$Sub_metering_1, type="l", col="black")
lines(sub_data$DateTime, sub_data$Sub_metering_2, type="l", col = "red")
lines(sub_data$DateTime, sub_data$Sub_metering_3, type="l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1),lwd=c(2.5,2.5))

dev.copy(png,'plot3.png', width = 480, height = 480)
dev.off()