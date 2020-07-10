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

list.files("./data")


# Read files in
subject_test <- readLines("./data/subject_test.txt")
subject_train <- readLines("./data/subject_train.txt")
body_acc_x_train <-  read.table("./data/body_acc_x_train.txt")
body_acc_y_train  <-  read.table("./data/body_acc_y_train.txt")
body_acc_z_train <-  read.table("./data/body_acc_z_train.txt")
body_gyro_x_train  <-  read.table("./data/body_gyro_x_train.txt")
body_gyro_y_train   <-  read.table("./data/body_gyro_y_train.txt")
body_gyro_z_train  <-  read.table("./data/body_gyro_z_train.txt")
total_acc_x_train   <-  read.table("./data/total_acc_x_train.txt")
total_acc_y_train   <-  read.table("./data/total_acc_y_train.txt")
total_acc_z_train   <-  read.table("./data/total_acc_z_train.txt")
X_train   <-  read.table("./data/X_train.txt")
y_train  <-  read.table("./data/y_train.txt")
body_acc_x_test <-  read.table("./data/body_acc_x_test.txt") 
body_acc_y_test   <-  read.table("./data/body_acc_y_test.txt")
body_acc_z_test   <-  read.table("./data/body_acc_z_test.txt")
body_gyro_x_test  <-  read.table("./data/body_gyro_x_test.txt")
body_gyro_y_test  <-  read.table("./data/body_gyro_y_test.txt")
body_gyro_z_test  <-  read.table("./data/body_gyro_z_test.txt")
total_acc_x_test  <-  read.table("./data/total_acc_x_test.txt")
total_acc_y_test  <-  read.table("./data/total_acc_y_test.txt")
total_acc_z_test  <-  read.table("./data/total_acc_z_test.txt")
X_test   <-  read.table("./data/X_test.txt")
y_test   <-  read.table("./data/y_test.txt")
features  <-  read.table("./data/features.txt")
activities <- read.table("./data/activity_labels.txt")



# Put data into a data frame or data table if very large, then look at the data 
test <- read.table("./data/body_acc_x_test.txt", header = FALSE, sep = "", 
                   dec = ".")
test1 <- read.table("./data/body_acc_y_test.txt", header = FALSE, sep = "", 
                   dec = ".")
XTest <- read.table("./data/X_test.txt", header = FALSE, sep = "", 
                    dec = ".")

# Get features togetgher and add activity names
total_labels_test = data.frame(activities[match(y_test[,1],activities[,1]),2])
total_labels_train = data.frame(activities[match(y_train[,1],activities[,1]),2])
test <- bind_cols(total_labels_test, X_test)
train <- bind_cols(total_labels_train, X_train)
totalData <-bind_rows(train, test)

# Get column cames from feature data set added to total data. 

featureNames <- c("activity", as.character(features[, 2]))
colnames(totalData) <- gsub("^[t]|[f]", "", featureNames)
View(totalData)





