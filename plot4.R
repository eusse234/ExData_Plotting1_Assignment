#Load the raw data
data <- read.csv("household_power_consumption.txt", sep=';', na.strings="?", stringsAsFactors=F)

#Set the class from Data variable
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Subset the data (from=01-Feb-2007 to=01-Feb-2007)
subdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#Paste Date and Time into a new variable
TotalTime <- paste(as.character(subdata$Date), subdata$Time)
subdata$TotalTime <- strptime(TotalTime, "%Y-%m-%d %H:%M:%S")

#Create plot 4

#Generate 4 cuadrant
par(mfrow=c(2,2))

#Top left quardrant graph
plot(subdata$TotalTime, subdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Top right quardrant graph
plot(subdata$TotalTime, subdata$Voltage, type="l", ylab="Voltage (volt)", xlab="datetime")

#Botton left quardrant graph
plot(subdata$TotalTime, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subdata$TotalTime, subdata$Sub_metering_2, col='red')
lines(subdata$TotalTime, subdata$Sub_metering_3, col='blue')
legend('topright',legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"),lty='solid', lwd=2.5)

#Botton right quadrant graph
plot(subdata$TotalTime, subdata$Global_reactive_power, type="l", ylab="Global_Reactive_Power",xlab="datetime")

#Save png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
