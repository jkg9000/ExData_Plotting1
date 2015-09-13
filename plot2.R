


setwd('/Users/JKG/Documents/00_coursera/eda/ExData_Plotting1')


fileName = "household_power_consumption.txt"
fullFilePath = paste(getwd(), "/", fileName, sep='')

smfile = "small.txt"
fullFilePathSmall = paste(getwd(), "/", smfile, sep='')

#if the limited-data version  (2007-02-01 through 2007-02-02 only) doesn't exist, create it 
if(!file.exists(fullFilePathSmall)) {
    data = read.table(fullFilePath, header=TRUE, sep=';')
    date = as.Date(origdata$Date, format="%d/%m/%Y")
    data$datetime = strptime(paste(date, data$Time), format="%Y-%m-%d %H:%M:%S")
    data = subset(data, datetime > strptime("2007-02-01", format="%Y-%m-%d"))
    data = subset(data, datetime < strptime("2007-02-03", format="%Y-%m-%d"))
    write.table(data, fullFilePathSmall, sep='\t', row.name=FALSE)
} else {
    data = read.table(fullFilePathSmall, header=TRUE, sep='\t')
}

data$datetime = strptime(data$datetime, format="%Y-%m-%d %H:%M:%S")


par(mfrow = c(1, 1), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0), mai = c(1,1,1,1))

with(data, plot(datetime, Global_active_power, main = "", xlab = '', ylab = "Global Active Power (kilowatts)", type = "n"))
lines(data$datetime, data$Global_active_power)

dev.copy(png, file = "plot2.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!






