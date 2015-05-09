data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings='?')
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
sub_data<-subset(data, as.Date(DateTime)>=as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

hist(sub_data$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()