# clear all plotting devices
graphics.off()
# read data from file
data <- read.csv('household_power_consumption.txt', sep=';', na.strings=c('?'))
# subset to dates of interest
subdata <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
# convert Date and Time columns to timestamps
timestamp <- strptime(paste(subdata$Date, subdata$Time), format='%d/%m/%Y %H:%M:%S')

# define multiplot layout and rescale labels
par(mfcol = c(2, 2), cex=.67)

# plot (1,1) is almost identical to plot2; only ylab is different
plot(timestamp, subdata$Global_active_power, type='l', pch='1', 
     main = '', xlab='', ylab = 'Global Active Power')

# plot (2,1) is almost identical to plot3; only the legend border (bty) is different
plot(timestamp, subdata$Sub_metering_1, type='l', pch=1, 
     main = '', xlab='', ylab = 'Energy sub metering', col='black')
lines(timestamp, subdata$Sub_metering_2, type='l', pch=1, col='red')
#     main = '', xlab='', ylab = 'Global Active Power (kilowatts)')
lines(timestamp, subdata$Sub_metering_3, type='l', pch=1, col='blue')
#     main = '', xlab='', ylab = 'Global Active Power (kilowatts)')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       lty=1, col=c('black', 'red', 'blue'), bty='n')

# plot (1,2) is similar to plot2
plot(timestamp, subdata$Voltage, type='l', pch='1', 
     main = '', xlab='datetime', ylab = 'Voltage')

# plot (2,2) is similar to plot2
plot(timestamp, subdata$Global_reactive_power, type='l', pch='1', 
     main = '', xlab='datetime', ylab = 'Global_reactive_power')

# Uncomment the next two lines to save as a PNG
# dev.copy(png, filename='plot4.png')
# dev.off()
