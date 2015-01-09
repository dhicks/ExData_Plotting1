# clear all plotting devices
graphics.off()
# read data from file
data <- read.csv('household_power_consumption.txt', sep=';', na.strings=c('?'))
# subset to dates of interest
subdata <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
# convert Date and Time columns to timestamps
timestamp <- strptime(paste(subdata$Date, subdata$Time), format='%d/%m/%Y %H:%M:%S')

# draw Sub_metering_1 time series to screen, with axes and other decorations
plot(timestamp, subdata$Sub_metering_1, type='l', pch=1, 
     main = '', xlab='', ylab = 'Energy sub metering', col='black')
# plot the other two time series without overwriting using lines()
# decorations can be suppressed, but are included in comments just in case
lines(timestamp, subdata$Sub_metering_2, type='l', pch=1, col='red')
#     main = '', xlab='', ylab = 'Global Active Power (kilowatts)')
lines(timestamp, subdata$Sub_metering_3, type='l', pch=1, col='blue')
#     main = '', xlab='', ylab = 'Global Active Power (kilowatts)')

# add the legend
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       lty=1, col=c('black', 'red', 'blue'))

# Uncomment the next two lines to save as a PNG
dev.copy(png, filename='plot3.png')
dev.off()
