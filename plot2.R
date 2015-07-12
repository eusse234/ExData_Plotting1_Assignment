#Load the raw data
data <- read.csv("household_power_consumption.txt", sep=';', na.strings="?", stringsAsFactors=F)

#Set the class from Data variable
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Subset the data (from=01-Feb-2007 to=01-Feb-2007)
subdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#Paste Date and Time into a new variable
TotalTime <- paste(as.character(subdata$Date), subdata$Time)
subdata$TotalTime <- strptime(TotalTime, "%Y-%m-%d %H:%M:%S")

#Create plot 2
plot(subdata$TotalTime, subdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Save png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

