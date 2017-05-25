
## Change the directory in R to the folder that zip file is stored.
# Read each file using readRDS() function in R:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load the packages used in the exploratory analysis:
library(ggplot2)
library(dplyr)

# Calculate total emissions of Baltimore city (fips=24510) by year:
Baltimore_emi<- NEI[NEI$fips=="24510",]
tot_Baltimore_year<- tapply(Baltimore_emi$Emissions, Baltimore_emi$year,sum)
tot_Baltimore_year
    1999     2002     2005     2008 
3274.180 	2453.916  	3091.354 	1862.282 

# Plot the Total Emission vs. Year:
plot(tot_Baltimore_year, type=”l”, xaxt=”n”, xlab=”Year”, ylab=”Total Emission”, main=”Total Emission in the Baltimore”)
axis(side=1, labels=as.character(years), at =1:length(years))

