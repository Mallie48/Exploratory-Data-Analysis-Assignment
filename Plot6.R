
## Change the directory in R to the folder that zip file is stored.
# Read each file using readRDS() function in R:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load the packages used in the exploratory analysis:
library(ggplot2)
library(dplyr)

# Factoring the data from NEI for years 1999 to 2008:
NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))
 
# Subsetting the factored data from NEI for Baltimore City and Los Angeles County for On-road type:
MD_on-road <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
CA_on-road <- subset(NEI, fips == '06037' & type == 'ON-ROAD')

# Aggregating the data:
MD_DF <- aggregate(MD_on-road[, 'Emissions'], by=list(MD_on-road$year), sum)
colnames(MD.DF) <- c('year', 'Emissions')
MD_DF$City <- paste(rep('MD', 4))

CA_DF <- aggregate(CA_on-road[, 'Emissions'], by=list(CA_on-road$year), sum)
colnames(CA_DF) <- c('year', 'Emissions')
CA_DF$City <- paste(rep('CA', 4))

DF <- as.data.frame(rbind(MD_DF, CA_DF))

# Plotting:
ggplot(data=DF, aes(x=year, y=Emissions)) + geom_bar(aes(fill=year)) + guides(fill=F) + 
+     ggtitle('Total Emissions of Motor Vehicle Sources\nLos Angeles County, California vs. Baltimore City, Maryland') + 
+     ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + facet_grid(. ~ City) + 
+     geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1))

## Based on the graph, Baltimore City has seen greater changes over time (1999 t0 2008) in motor vehicle emissions.
