# clear all plotting devices
graphics.off()
# read data from file
data <- read.csv('household_power_consumption.txt', sep=';', na.strings=c('?'))
# subset to dates of interest
subdata <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
# convert Date and Time columns to timestamps
timestamp <- strptime(paste(subdata$Date, subdata$Time), format='%d/%m/%Y %H:%M:%S')

# draw Global_active_power against timestamp to screen
plot(timestamp, subdata$Global_active_power, type='l', pch='1', 
     main = '', xlab='', ylab = 'Global Active Power (kilowatts)')

# Uncomment the next two lines to save as a PNG
# dev.copy(png, filename='plot2.png')
# dev.off()
