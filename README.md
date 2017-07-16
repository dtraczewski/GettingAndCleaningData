# Getting and Cleaning Data - Course Project

This is the course project for the Getting and Cleaning Data Coursera course.
The R script, `DataAnalysis.R`, does the following:

1. Download the dataset and unzpi it if it does not already be unzipped in the working directory
2. Load the activity and feature data
3. Loads both the training and test datasets and keeping only those variables which
   reflect a mean or standard deviation of some characteristics
4. Loads the activity and subject data for each dataset, and merges those
   columns with the dataset
5. Merges the two datasets
6. Converts the `activity` and `subject` columns into factor variables
7. Creates a tidy dataset that consists of the average (mean) value of each
   variable for each subject and activity pair.

The end result is shown in the file `FinalData.txt`.
