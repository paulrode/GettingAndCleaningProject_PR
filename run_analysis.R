source("setup.r")

# Set up my R enviroment
setup()
ReadInFiles()


# Merges the training and the test sets to create one data set.


colnames(activities) <- c("Activity", "Description")
colnames(y_test) <- c("Activity", "Description")
colnames(y_train) <- c("Activity", "Description")
y_test <- left_join(y_test, activities)
y_train <- left_join(y_train, activities)
test <- bind_cols(y_test, X_test)
train <- bind_cols(y_train, X_train)
totalData <-bind_rows(train, test)

# Create feature names for totalData dataframe and clean up special characters 
featureNames <- c("activity", "description", as.character(features[, 2]))

featureNames <- gsub("^[t]|[f]", "", featureNames)
featureNames = gsub("[()-]"," ",featureNames)
colnames(totalData) <- featureNames
grep("[Mean]|[mean]|[std]", featureNames, value = FALSE)

view(totalData)


