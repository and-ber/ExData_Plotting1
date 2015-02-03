# Exploratory Data Analysis
# Course Project no.1

# The data file 'household_power_consumption.txt' shall be positioned in the working directory

# Loads only a calculated portion of the data file into memory keeping the column names
names <- data <- read.csv("household_power_consumption.txt", sep=";", nrows=1)
data <- read.table("household_power_consumption.txt", sep=";", nrows=5760, skip= 64800, 
                   col.names=colnames(names))

# Converts Date column to Date data type and Time column to Time type with the right date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- as.POSIXct(paste(data$Date, data$Time))

# Subsets data relative only to dates 2007-02-01 and 2007-02-02
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# Plot2: Plots the XY Scatter with Global Active P. vs Date/Time on the screen and copies into a png file 
par(mfrow = c(1,1))
plot(data$Time,data$Global_active_power,"l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,'plot2.png')
dev.off()