## Read the files
d_emissions <- readRDS("summarySCC_PM25.rds")
c_code <- readRDS("Source_Classification_Code.rds")

## Command for subsetting to just data from Baltimore and adding up emissions per year
d_baltimore <- subset(d_emissions, d_emissions$fips=="24510")
d_y_baltimore <- aggregate(d_baltimore$Emissions, by=list(d_baltimore$year), 
                                 FUN=sum)
## Plot to .png file
png(filename = "plot2.png")
plot(d_y_baltimore$Group.1, d_y_baltimore$x, type = "l", 
     main = "Total PM2.5 Emissions", xlab = "year", 
     ylab = "Total PM2.5 Emissions (Tons)")
dev.off()
