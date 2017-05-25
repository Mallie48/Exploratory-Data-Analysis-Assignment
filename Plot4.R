
## Change the directory in R to the folder that zip file is stored.
# Read each file using readRDS() function in R:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load the packages used in the exploratory analysis:
library(ggplot2)
library(dplyr)

# Filtering the SCC data by “coal” and “combustion” in SCC:
scc_coal<- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets, NEI and SCC_coal:
merge<- merge(x=NEI, y=scc_coal, by='SCC')
merge.sum<- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum)<- c('Year', 'Emissions')

# Generate the plot using ggplot():
ggplot(data=merge.sum, aes(x=Year, y=Emissions/1000)) + 
+ geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
+ ggtitle(expression('Total Emissions of PM'[2.5])) +
+ ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) +
+ geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) +
+ theme(legend.position='none') + scale_colour_gradient(low='black', high='red')

## The emission from coal combustion related source are decreased 60% from 1999 to 2008.

