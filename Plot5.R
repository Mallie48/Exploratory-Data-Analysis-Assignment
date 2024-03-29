
## Change the directory in R to the folder that zip file is stored.
# Read each file using readRDS() function in R:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load the packages used in the exploratory analysis:
library(ggplot2)
library(dplyr)

# Factoring the data from NEI for years 1999 to 2008:
NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Subsetting the data from 1999 to 2008 for city Baltimore (fips=24510):
MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregating:
MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)

# Plotting:
colnames(MD.df) <- c('year', 'Emissions')
ggplot(data=MD.df, aes(x=year, y=Emissions)) + geom_bar(stat="identity", aes(fill=year)) + guides(fill=F) + 
+     ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
+     ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
+     geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))

## The emission in Baltimore City decreased by 75% from 1999 to 2008.
