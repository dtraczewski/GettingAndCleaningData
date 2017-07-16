# Getting and Cleaning Data - Course Project

The R script, `run_analysis.R`, does the following:

1. Downloads the dataset and unzip it if it does not already be unzipped in the working directory
2. Loads the activity and feature datasets
3. Loads both the training and test datasets and keeping only those variables which
   contain a mean or standard deviation of some characteristics
4. Loads the activity and subject information for each dataset
5. Merges those columns with the dataset
6. Merges both of datasets
7. Makes the `activity` and `subject` columns factor variables
8. Creates a tidy dataset that contains the mean value of each
   variable for each subject and activity pair which is the purpose of this project.

The final result can be observed in the file `FinalData.txt`.
