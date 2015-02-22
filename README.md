# Overview

This repository implements the requirements for the course project of Coursera Getting and Cleaning data:

1. You should create one R script called run_analysis.R that does the following. 
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

These requirements are implemented in the R script `run_analysis.r`

The script outputs a tidy dataset `tidydata.txt`.  See `CodeBook.md` for a description of the output.

# Assumptions

Source data has been downloaded and unzipped in working directory: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Implementation
````R
# load data files

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

features <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# name test data
colnames(x_test) <- features[,2]

# clean up illegal symbols "-", "(", and ")"
colnames(x_test) <- gsub(pattern = "\\(|\\)","",colnames(x_test))
colnames(x_test) <- gsub(pattern = "-",".",colnames(x_test))
colnames(x_test) <- gsub(pattern = "BodyBody","Body",colnames(x_test))
colnames(y_test) <- c("Activity")
colnames(subject_test) <- c("Subject")

## name train data
colnames(x_train) <- features[,2]
# clean up illegal symbols "-", "(", and ")"
colnames(x_train) <- gsub(pattern = "\\(|\\)","",colnames(x_train))
colnames(x_train) <- gsub(pattern = "-",".",colnames(x_train))
colnames(x_train) <- gsub(pattern = "BodyBody","Body",colnames(x_train))

colnames(y_train) <- c("Activity")
colnames(subject_train) <- c("Subject")

# column bind test
test <- cbind(subject_test, y_test, x_test)

# column bind train
train <- cbind(subject_train, y_train, x_train)

# row bind test and train
alldata <- rbind(test,train)

# find column index that match -mean() or -std()
mean_std_index <- grep("-mean\\(\\)|-std\\(\\)", names(alldata),ignore.case = T)

# grab subject, activity, and mean and standard columns
mean_std_data <- alldata[c(1,2,meanstdindex)]

# factor and name activities
mean_std_data$Activity <- factor(mean_std_data$Activity, labels = as.vector(activities[,2]))

# factor subjects
mean_std_data$Subject <- factor(mean_std_data$Subject)

# take the mean of all measurements, grouped by Subject and Activity
data <- aggregate(. ~Subject + Activity, mean_std_data, mean)

# write data
write.table(data,"tidydata.txt", row.name=FALSE)
````