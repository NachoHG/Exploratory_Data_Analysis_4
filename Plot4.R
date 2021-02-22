## Read the files
d_emissions <- readRDS("summarySCC_PM25.rds")
c_code <- readRDS("Source_Classification_Code.rds")

## Records involving coal
cc_code <- c_code[grepl("Coal", c_code$Short.Name), ]
ce_data <- d_emissions[d_emissions$SCC %in% cc_code$SCC, ]

## Command for adding up the emissions per year
ce_year <- aggregate(ce_data$Emissions, 
                                 by=list(ce_data$year), FUN=sum)
colnames(ce_year) <- c("year", "emissions")

## Plot to .png file
png(filename = "plot4.png")
plot(ce_year$year, ce_year$emissions, type = "o",
     xlab = "Year",
     ylab = "Total PM2.5 Emissions (Tons)",
     main = "Coal Related Emissions of PM2.5 in US from 1999-2008")
dev.off()
