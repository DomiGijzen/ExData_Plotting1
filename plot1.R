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
        png("plot1.png")
        hist(sub_po_co$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
        dev.off()
}