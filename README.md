run_analysis.R
===========

R version: 3.1.2

Required packages: dplyr, utils

Required files in working directory: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This script organizes the raw txt data from the UCI Human Activity Recognition Using Smartphones dataset from UCI into an R dataframe. 

It outputs a file mean_table.txt into the working directory that can be read into an R data frame by calling read.table("mean_table.txt", header=TRUE)

The final data set is a frame giving the average of each variable (named in features_info.txt) by unique subject and activity, identified in the data frame as subject_id and activity_label respectively.


