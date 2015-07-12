#Load the raw data
data <- read.csv("household_power_consumption.txt", sep=';', na.strings="?", stringsAsFactors=F)

#Set the class from Data variable
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Subset the data (from=01-Feb-2007 to=01-Feb-2007)
subdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#Paste Date and Time into a new variable
TotalTime <- paste(as.character(subdata$Date), subdata$Time)
subdata$TotalTime <- strptime(TotalTime, "%Y-%m-%d %H:%M:%S")

#Create plot 3
plot(subdata$TotalTime, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subdata$TotalTime, subdata$Sub_metering_2, col='red')
lines(subdata$TotalTime, subdata$Sub_metering_3, col='blue')

#Add legend
legend('topright',legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"),lty='solid', lwd=2.5)

#Save png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
