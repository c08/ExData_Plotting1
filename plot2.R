########################################################################################################################
# Script to create the plot 2 of the first assigment of the Exploratory Data Analysis Course of Coursera
########################################################################################################################

# read in data
electric<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", as.is=TRUE)

# subset for correct two day
electric$Date<-as.Date(electric$Date, format = "%d/%m/%Y")
electric_subset<-subset(electric, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

#Add date and time
electric_subset$datetime<-as.POSIXct(paste(electric_subset$Date, electric_subset$Time), format="%Y-%m-%d %H:%M:%S")

#Create plot
png("plot2.png", width=480, height=480, units="px", bg="transparent")
plot(electric_subset$datetime, electric_subset$Global_active_power, ylab="Global Average Power (kilowatts)", xlab="", type="l")
dev.off()
