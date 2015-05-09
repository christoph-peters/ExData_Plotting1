data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings='?')
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
sub_data<-subset(data, as.Date(DateTime)>=as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

plot(sub_data$DateTime, sub_data$Global_active_power, type="n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(sub_data$DateTime, sub_data$Global_active_power, type="l")

dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()