## Question 1
## Have total emissions from PM2.5 decreased in the United States
## from 1999 to 2008? Using the base plotting system, make a plot
## showing the total PM2.5 emission from all sources for each of
## the years 1999, 2002, 2005, and 2008.
## YES!

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Aggregate by sum the total emissions by year
aggTotals <- aggregate(Emissions ~ year,NEI, sum)

## Produce a PNG file
png("plot1.png",width=480,height=480,units="px",bg="transparent")

## Create barplot
barplot(
      (aggTotals$Emissions)/10^6,
      names.arg=aggTotals$year,
      xlab = "Year",
      ylab = expression('Total PM'[2.5]*' Emission'),
      main = expression('Total PM'[2.5]*' Emissions from all U.S. Sources 1999 - 2008'),
      col = "chocolate"
)

## Turn the graphics device off
dev.off()