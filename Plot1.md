
### Change the directory in R to the folder that zip file is stored
### Read each file using readRDS() function in R:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Check with dir() to see if the files are there: 
dir()
[1] "~$ading the zip file from R.docx"
[2] "Reading the zip file from R.docx"
[3] "Source_Classification_Code.rds"  
[4] "summarySCC_PM25.rds"             

### Find some detail information with commands:
dim(SCC)
[1] 11717    15
dim(NEI)
dim(NEI)
[1] 6497651       6

str(NEI)
head(NEI)
head(SCC)

### Load the packages used in the exploratory analysis:
library(ggplot2)
library(plyr)

### Get Unique lines in the data frame:
years<- unique(NEI$year)
types<- unique (NEI$tyear)
str(NEI)

### Calculate total emission by year in the U.S.:
tot_emi_year<- tapply(NEI$Emissions, NEI$year, sum)
tot_emi_year
1999    2002    2005    2008 
7332967 5635780 5454703 3464206 

### Plot 
plot(tot_emi_year, type="l", xaxt="n", xlab="Year", ylab="Total Emissions", main="Total Emission in the U.S.")
