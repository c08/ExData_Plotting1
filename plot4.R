########################################################################################################################
# Script to create the plot 4 of the first assigment of the Exploratory Data Analysis Course of Coursera
########################################################################################################################

# read in data
electric<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", as.is=TRUE)

# subset for correct two day
electric$Date<-as.Date(electric$Date, format = "%d/%m/%Y")
electric_subset<-subset(electric, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

#Add date and time
electric_subset$datetime<-as.POSIXct(paste(electric_subset$Date, electric_subset$Time), format="%Y-%m-%d %H:%M:%S")

#Create plot
png("plot4.png", width=480, height=480, units="px", bg="transparent")

#Divide the plot in 4
par(mfrow=c(2,2))

#First plot
plot(electric_subset$datetime, electric_subset$Global_active_power, ylab="Global Average Power", xlab="", type="l")

#Second plot
plot(electric_subset$datetime, electric_subset$Voltage, ylab="Voltage", xlab="", type="l")

#Third plot
plot(electric_subset$datetime, electric_subset$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(electric_subset$datetime, electric_subset$Sub_metering_2, col="red")
lines(electric_subset$datetime, electric_subset$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"))

#Fourth plot
plot(electric_subset$datetime, electric_subset$Global_reactive_power, ylab="Global_reactive_power", xlab="", type="l")

dev.off()
