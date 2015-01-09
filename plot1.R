# clear all plotting devices
graphics.off()
# read data from file
# for na.strings : http://stackoverflow.com/questions/16980646/about-na-strings-in-read-table-function-in-r
data <- read.csv('household_power_consumption.txt', sep=';', na.strings=c('?'))
# subset to dates of interest
subdata <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# draw histogram to screen
hist(subdata$Global_active_power, col='red', 
     main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

# Uncomment the next two lines to save as a PNG
# dev.copy(png, filename='plot1.png')
# dev.off()
