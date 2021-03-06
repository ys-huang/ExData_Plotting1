#read from txt file
data <- read.table("ExData_Plotting1/household_power_consumption.txt", header=T, sep=";", 
                   colClasses=c("character","character","double","double","double","double","double","double","numeric"),
                   na.strings="?")

#filter the two day data we need
data1 <- data[data$Date == "1/2/2007" |data$Date == "2/2/2007",]

#transform  Date and Time variables to Date/Time classes
data1$DateTime <- paste(data1$Date, data1$Time)
data1$DateTime <- strptime(data1$DateTime, "%d/%m/%Y %H:%M:%S")

#make plot2
png("ExData_Plotting1/plot2.png", width = 504, height = 504, bg = "transparent")
plot(data1$DateTime, data1$Global_active_power, 
     xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()