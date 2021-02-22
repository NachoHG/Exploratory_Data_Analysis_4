## Read the files
d_emissions <- readRDS("summarySCC_PM25.rds")
c_code <- readRDS("Source_Classification_Code.rds")

## Command for subsettting data from Baltimore City from type "on road"
car_data <- subset(d_emissions, d_emissions$fips=="24510" 
                             & d_emissions$type=="ON-ROAD")
car_year <- aggregate(car_data$Emissions, 
                                by=list(car_data$year), FUN=sum)
colnames(car_year) <- c("Year", "Emissions")

## Plot to .png file that shows car related emissions in Baltimore City from 1999-2008
png(filename = "plot5.png")
plot(car_year$Year, car_year$Emissions,
     type = "o",
     xlab = "year",
     ylab = "Total PM2.5 Emissions (Tons)",
     main = "Total Emissions (Vehicles)",
     sub = "Baltimore City")
dev.off()