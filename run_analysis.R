source("setup.r")

# Set up my R enviroment
setup()


subject_test <- readLines("./data/subject_test.txt")
subject_train <- readLines("./data/subject_train.txt")
X_train   <-  read.table("./data/X_train.txt")
y_train  <-  read.table("./data/y_train.txt")
X_test   <-  read.table("./data/X_test.txt")
y_test   <-  read.table("./data/y_test.txt")
features  <-  read.table("./data/features.txt")
activities <- read.table("./data/activity_labels.txt")

# Merges the training and tes to create totalDate
# First puts in discriptive feaure, activity, and subject names. 
# Then combines the modified training and test data sets 
# Cleans up feature names 

colnames(activities) <- c("Activity", "Description")
colnames(y_test) <- c("Activity")
colnames(y_train) <- c("Activity")
subject_test <- data.frame(Subject = subject_test)
subject_train <- data.frame(Subject = subject_train)
y_test <- left_join(y_test, activities)
y_train <- left_join(y_train, activities)
test <- bind_cols(y_test, subject_test, X_test)
train <- bind_cols(y_train, subject_train, X_train)
totalData <-bind_rows(train, test)
glimpse(totalData)
featureNames <- c("Activity", "Description", "Subject", as.character(features[, 2]))
featureNames <- gsub("^[t]|[f]", "", featureNames)
featureNames = gsub("[()-]"," ",featureNames)
colnames(totalData) <- featureNames
subgroup <- grep("Mean|mean|std", featureNames, value = FALSE)

sub_table <- totalData[,c(2,3,subgroup)]
#sub_table$Description <-as.character(sub_table$Description)
sub_table$Subject <- as.numeric(sub_table$Subject)
sub_table$Subject <- as.factor(sub_table$Subject)
glimpse(sub_table)

# Table made that groups by Subject and Description and provides mean values for each unique pair. 
sub_table %>% group_by(Subject, Description) %>% summarise_all(funs(mean)) -> answer

# Pring results to viewer
View(sub_table)   
view(answer)

# Text generated for CodeBook.md
totalData_features <- colnames(totalData)
totalData_features <- data.frame(totalData_features)
glimpse(totalData_features)
view(totalData_features)


# Table exported for upload for grading and review
write.table(answer, file = "answer.txt", row.names = FALSE)
list.files()
