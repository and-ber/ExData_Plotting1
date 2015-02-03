# Exploratory Data Analysis
# Course Project no.1

# The data file 'household_power_consumption.txt' shall be positioned in the working directory

# Loads only a calculated portion of the data file into memory keeping the column names
names <- read.csv("household_power_consumption.txt", sep=";", nrows=1)
data <- read.table("household_power_consumption.txt", sep=";", nrows=5760, skip= 64800, 
                   col.names=colnames(names))

# Converts Date column to Date data type and Time column to Time type with the right date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- as.POSIXct(paste(data$Date, data$Time))

# Subsets data relative only to dates 2007-02-01 and 2007-02-02
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

#Plot4: plots 4 different XY Scatters in the same page
png("plot4.png")
par(mfrow = c(2,2))
plot(data$Time,data$Global_active_power,"l", xlab="", ylab="Global Active Power (kilowatts)")

plot(data$Time,data$Voltage,"l", xlab="datetime", ylab="Voltage")

plot(data$Time,data$Sub_metering_1,"l", xlab="", ylab="Energy sub metering", col="black")
lines(data$Time,data$Sub_metering_2, col="red")
lines(data$Time,data$Sub_metering_3, col="blue")
legend("topright", colnames(data[,7:9]) , lty=1, col=c("black", "red", "blue"), bty="n", cex=.95)

with(data, plot(Time,Global_reactive_power,"l", xlab="datetime"))
dev.off()