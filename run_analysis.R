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

list.files("./data")

# Put data into a data frame or data table if very large, then look at the data 
test <- read.table("./data/body_acc_x_test.txt", header = FALSE, sep = "", 
                   dec = ".")
test1 <- read.table("./data/body_acc_y_test.txt", header = FALSE, sep = "", 
                   dec = ".")

str(test1)
glimpse(test1)
glimpse(test)
head(test1, 10)
tail(test1, 10)
view(test1)


gdp_edu <- merge(gdp.r, edu.r)
glimpse(gdp_edu)

length( grep("Fiscal year end: June 30", gdp_edu$Special.Notes))