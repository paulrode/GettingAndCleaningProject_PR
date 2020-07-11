Coursera course Getting and Cleaning Data for R. 

Project statement copied from Coursera instructions


I created an R script called run_analysis.R that does the following:

  1.  Merges the training and the test sets to create one data set.
  2.  Extracts only the measurements on the mean and standard deviation for each measurement.
  3.  Uses descriptive activity names to name the activities in the data set.
  4.  Appropriately labels the data set with descriptive variable names.
  5.  From the data set in step 4, creates a second, independent tidy data set with the average of each            variable for each activity and each subject.

Part 1
I also created a set up script that I sourced, which loads the common R packages that I use when drafting code. 

Relivant files are read in. 

The logic flow proceeds by first applying feature names and observation names to the test and training data sets. 

Next the two sets are combined to a master set as a data table titled totalData. 

Part 2
Feature headings are used and selections to make a subgroup of features, from which a sub table is made. 

Part 3 Performed joins to bring descriptive activity names into the data frames.

Part 4 Throughout the wrangling above the feature names were cleaned up. 

Part 5 a grouping and summarization performed to make the data frame answer, from the data frame sub_table.
