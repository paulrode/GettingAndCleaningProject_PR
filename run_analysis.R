source("setup.r")

# Set up my R enviroment
setup()
ReadInFiles()


# Merges the training and the test sets to create one data set.


colnames(activities) <- c("Activity", "Description")
colnames(y_test) <- c("Activity", "Description")
colnames(y_train) <- c("Activity", "Description")
subject_test <- data.frame(Subject = subject_test)
subject_train <- data.frame(Subject = subject_train)
y_test <- left_join(y_test, activities)
y_train <- left_join(y_train, activities)
test <- bind_cols(y_test, subject_test, X_test)
train <- bind_cols(y_train, subject_train, X_train)
totalData <-bind_rows(train, test)

# Create feature names for totalData dataframe and clean up special characters 
featureNames <- c("Activity", "Description", "Subject", as.character(features[, 2]))

featureNames <- gsub("^[t]|[f]", "", featureNames)
featureNames = gsub("[()-]"," ",featureNames)
colnames(totalData) <- featureNames
subgroup <- grep("Mean|mean|std", featureNames, value = FALSE)

sub_table <- totalData[,c(2,3,subgroup)]
sub_table$Description <-as.character(sub_table$Description)
sub_table$Subject <- as.numeric(sub_table$Subject)

sub_table %>% group_by(Description, Subject) %>% summarize(funs(mean)) -> answer

view(answer)
