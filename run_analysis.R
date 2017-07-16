#####################################################################################
################################## Getting and Cleaning Data Course Project: ########
#####################################################################################

# Load useful package:
library(reshape2)

# Set filename:
filename <- "getdata_dataset.zip"

## Download and unzip the dataset:
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, filename) # for MACs it would be better to use method = "curl"

if (!file.exists("UCI HAR Dataset")) { 
  unzip(zipfile = filename) 
}

# Load activity labels + their features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2]) # change into character features
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2]) # change into character features

# Extract only the data on mean and standard deviation
remainedFeatures <- grep(".*mean.*|.*std.*", features[,2])
remainedFeatures.names <- features[remainedFeatures,2]

# Change and clean names
remainedFeatures.names = gsub('-mean', 'Mean', remainedFeatures.names)
remainedFeatures.names = gsub('-std', 'Std', remainedFeatures.names)
remainedFeatures.names <- gsub('[-()]', '', remainedFeatures.names)

# Load the datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")[remainedFeatures]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Merge datasets:
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[remainedFeatures]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge Datasets:
test <- cbind(testSubjects, testActivities, test)

# merge datasets and add labels
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", remainedFeatures.names)

# turn activities & subjects into factors
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)

allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

write.table(allData.mean, "FinalData.txt", row.names = FALSE, quote = FALSE)
