## Read the files
d_emissions <- readRDS("summarySCC_PM25.rds")
c_code <- readRDS("Source_Classification_Code.rds")

## Command for subsettting data from Baltimore City, LA county and from type "on road"
LA_Car_data <- subset(d_emissions, d_emissions$fips=="24510" |
                            d_emissions$fips=="06037" &
                            d_emissions$type=="ON-ROAD")
LA_Car_year <- aggregate(LA_Car_data$Emissions, 
                             by=list(LA_Car_data$fips, LA_Car_data$year),
                             FUN=sum)
colnames(LA_Car_year) <- c("City", "Year", "Emissions")

## Plot to .png file that compares emissions from motor vehicles in Baltimore and LA from 1999-2008
library(ggplot2)
png(filename = "plot6.png")
qplot(Year, Emissions, data = LA_Car_year, color = City, geom = "line") +
  ggtitle("Total PM2.5 Emissions in Baltimore City (24510) and LA County (06037)") + 
  ylab("Total Emissions from motor vehicles (Tons)") + 
  xlab("Year") 
dev.off()