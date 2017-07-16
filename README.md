# Getting and Cleaning Data - Course Project

The file `run_analysis.R`, which is the R script, prepares cleaning of the data in following steps:

1. Downloading the dataset and unzip it if it does not already be unzipped in the working directory
2. Loading the activity and feature datasets
3. Loading both the training and test datasets and keeping only those variables which
   contain a mean or standard deviation of some characteristics
4. Loading the activity and subject information for each dataset
5. Merging those columns with the dataset
6. Merging both of datasets
7. Making the `activity` and `subject` columns factor variables
8. Creating a tidy dataset that contains the mean value of each
   variable for each subject and activity pair which is the purpose of this project.

The final result can be observed in the textfile `FinalData.txt`.
