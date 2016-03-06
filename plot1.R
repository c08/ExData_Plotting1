########################################################################################################################
# Script to create the plot 1 of the first assigment of the Exploratory Data Analysis Course of Coursera
########################################################################################################################

# read in data
electric<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", as.is=TRUE)

# subset for correct two day
electric$Date<-as.Date(electric$Date, format = "%d/%m/%Y")
electric_subset<-subset(electric, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))


#Create plot
png("plot1.png", width=480, height=480, units="px", bg="transparent")
hist(electric_subset$Global_active_power,col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
