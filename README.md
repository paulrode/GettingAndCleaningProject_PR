# GettingAndCleaningProject_PR

You should create one R script called run_analysis.R that does the following.

  1.  Merges the training and the test sets to create one data set.
  2.  Extracts only the measurements on the mean and standard deviation for each measurement.
  3.  Uses descriptive activity names to name the activities in the data set
  4.  Appropriately labels the data set with descriptive variable names.

The logic flow proceeds by first applying feature names and observation names to the test and training data sets. Next the two sets are combined to a master set as a tibble titled totalData. Finaly the feature headings are copied into a vector from which a grep() function is used to tag the mean and std feachers. Using this a select function is used to creat the std and mean database subset. 


From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.