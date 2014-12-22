run_analysis.R
===========

R version: 3.1.2

Required packages: dplyr, utils

Required files in working directory: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This script organizes the raw txt data from the UCI Human Activity Recognition Using Smartphones dataset from UCI into an R dataframe. 

It outputs a file mean_table.txt into the working directory that can be read into an R data frame by calling read.table("mean_table.txt", header=TRUE)

The final data set is a frame giving the average of each variable (named in features_info.txt) by unique subject and activity, identified in the data frame as subject_id and activity_label respectively.

Process:

The script uses read.table to read the test result data X_test.txt and  X_train.txt into different data frames. 

It reads subject_test.txt and subject_train.txt into a table to serve as subject labels in final subject_ID column. 

It reads y_test.txt and y_train.txt into a table to serve as the activity labels to serve as activity labels in the final activity_label column. The values 1 through 6 are replaced with descriptive names. 

The subject id and activity label columns are combined with their respective training or test result sets. A column called subject_category is added to each data set that indicates whether the subject was part of the "train" or "test" group. The two resulting data frames are merged into a data frame with 10299 rows and 546 columns in a variable called merged_data. 

For the final data set, the subject_id, subject_category and activity_label columns are selected along with only the variables with "mean" or "std" in their name. The data is then aggregated into mean_table with 180 rows (30 subjects x 6 activities) with the mean of all trials for each variable for each unique record of subject and activity. 

