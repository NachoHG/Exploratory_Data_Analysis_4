## Read the files
d_emissions <- readRDS("summarySCC_PM25.rds")
c_code <- readRDS("Source_Classification_Code.rds")

## Command for adding up the emissions per year
adding_year <- aggregate(emissions_data$Emissions, by=list(year=emissions_data$year), FUN=sum)

## Plot to .png file
png(filename = "plot1.png")
plot(adding_year$year, adding_year$x, type = "l", 
     main = "Total PM2.5 Emissions",
     ylab = "Total PM2.5 Emmissions (Tons)",
     xlab = "Year")
dev.off()
