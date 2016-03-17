plot1 <- function(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                         directory = "~/R/4.1"
        ) {
## Install and load libraries
        ##
        
        ## Prepare WD and get files
        ## Set working dir and download data      
        setwd(directory)
        ## file is only downloaded and unzipped when it doesn't exist
        if (!file.exists("exdata-data-household_power_consumption.zip")) {
                download.file(url, "exdata-data-household_power_consumption.zip")
                unzip("exdata-data-household_power_consumption.zip")
        }
## Read data
        ## Get full source
        ##power_consumption_source <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
        ## Set date and time columns
        power_consumption <- power_consumption_source
        ##power_consumption$Date <- strptime(power_consumption$Date, format = "%d/%m/%Y")
        ##power_consumption$Time <- strptime(power_consumption$Time, format = "%H:%M:%S")
        power_consumption$DateTime <- strptime(paste(power_consumption$Date, power_consumption$Time), format = "%d/%m/%Y %H:%M:%S")
        ##subset the requires dat for date 2007-02-01 and 2007-02-02
        sub_po_co <- subset(power_consumption, Date == "2007-02-01" | Date == "2007-02-02")
## Start plotting
        png("plot4.png")
        par(mfrow=c(2,2))
        plot(sub_po_co$DateTime, sub_po_co$Global_active_power, type = "n", main = "", xlab = "", ylab = "Global Active Power")
        lines(sub_po_co$DateTime, sub_po_co$Global_active_power)
        plot(sub_po_co$DateTime, sub_po_co$Voltage, type = "n", main = "", xlab = "datetime", ylab = "Voltage")
        lines(sub_po_co$DateTime, sub_po_co$Voltage)
        plot(sub_po_co$DateTime, sub_po_co$Sub_metering_1, type = "n", main = "", xlab = "", ylab = "Energy sub metering")
        lines(sub_po_co$DateTime, sub_po_co$Sub_metering_1, col = "black")
        lines(sub_po_co$DateTime, sub_po_co$Sub_metering_2, col = "red")
        lines(sub_po_co$DateTime, sub_po_co$Sub_metering_3, col = "blue")
        legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = c(2.5, 2.5, 2.5), col = c("black","red","blue"))
        plot(sub_po_co$DateTime, sub_po_co$Global_reactive_power, type = "n", main = "", xlab = "datetime", ylab = "Global_reactive_power")
        lines(sub_po_co$DateTime, sub_po_co$Global_reactive_power)
        dev.off()
}