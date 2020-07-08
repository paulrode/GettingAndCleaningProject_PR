#Set up enviroment for R scrip  
# Packages for tidyverse 
library("tidyverse")
library("lubridate")
# Package for building tables in markdown and notebook 
library("knitr")
library("kableExtra") 
# Package for forecasting
library("fpp2")
# Packages for reading excel and html files and XML
library("openxlsx")
library("XML")
# Parkage for using data tables for very large data operations
library("data.table")
#Package for reading fixed width tables
library("utils")
# Packages for reading data through API's 
library("httr")
library("jsonlite")
# Package for performing inquires with SQL databases 
library("sqldf")
#Package for reading and writing to jpeg files
library("jpeg")

# Set proper working Dir
if (!getwd() == "C:/Users/paulr/Documents/R/GettingAndCleaningProject_PR") {setwd("./GettingAndCleaningProject_PR")}

# Check for data directory and if one is not present then make it
if (!file.exists("data")) {
  dir.create("data")
}

# Download data using a URL into th data directory

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile = "./data/gdp")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl, destfile = "./data/edu")
dateDownloaded <- date()
dateDownloaded
list.files("./data")

# Put data into a data frame or data table if very large, then look at the data 
gdp.r <- data.frame(read.csv("./data/gdp", skip = 4, nrows = 231))
colnames(gdp.r)[1] = c("CountryCode")
edu.r <- data.frame(read.csv("./data/edu"))
glimpse(gdp.r)
glimpse(edu.r)
head(gdp.r, 10)
head(edu.r, 10)
tail(gdp.r, 10)
tail(edu.r, 40)
view(gdp_edu)


gdp_edu <- merge(gdp.r, edu.r)
glimpse(gdp_edu)

length( grep("Fiscal year end: June 30", gdp_edu$Special.Notes))