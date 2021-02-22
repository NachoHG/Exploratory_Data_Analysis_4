
## Read the files
d_emissions <- readRDS("summarySCC_PM25.rds")
c_code <- readRDS("Source_Classification_Code.rds")

## Command for subsetting to just data from Baltimore and adding up emissions per year by "type"
d_baltimore <- subset(d_emissions, d_emissions$fips=="24510")
t_y_baltimore <- aggregate(d_baltimore$Emissions, 
                                 by=list(d_baltimore$type, d_baltimore$year), 
                                 FUN=sum)
colnames(t_y_baltimore) <- c("Type", "Year", "Emissions")

## Plot to .png file using ggplot2
library(ggplot2)
png(filename = "plot3.png")
qplot(Year, Emissions, data = t_y_baltimore, color = Type, geom = "line") +
  ggtitle("Total PM2.5 Emissions (Pollutant Type)") + 
  ylab("Total PM2.5 Emissions (Tons)") + 
  xlab("Year") 
dev.off()