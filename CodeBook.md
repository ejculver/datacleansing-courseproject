# Source Data

Original data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

See README.TXT therein for description of source data.

# Transformations

The following transformations were made on the source data:

* Combine column wise the training data: subject_train, x_train, y_train
* Combine column wise the test data: subject_test, x_test, y_test
* Combine row wise the training data and the source data
* Clean up the column names of the measurements: remove "(" and ")" characters, convert "-" to ".", correct occurances of BodyBody to Body
* Replace the coded activity (1-6) with it's descripive activity. 
* Extract Subject Number, Activity, and measurements where the measurement name contains "-mean()" OR "-std()", representing mean and standard deviation measurements
* Take the average (mean) of each measurement, grouped by subject number and activity

This results in the below comma separated value tidy data set.

# Tidy Data
COLUMN NUMBER, 
NAME, 
DESCRIPTION, 
VALUES

1, 
Subject, 
The ID of the subject, 
1-30

2,
Activity,
The descriptive activity of the subject,
"WALKING" "WALKING_UPSTAIRS" "WALKING_DOWNSTAIRS" "SITTING" "STANDING""LAYING"

3-68,
"tBodyAcc.mean.X"       "tBodyAcc.mean.Y"      
 "tBodyAcc.mean.Z"       "tBodyAcc.std.X"        "tBodyAcc.std.Y"        "tBodyAcc.std.Z"       
 "tGravityAcc.mean.X"    "tGravityAcc.mean.Y"    "tGravityAcc.mean.Z"    "tGravityAcc.std.X"    
 "tGravityAcc.std.Y"     "tGravityAcc.std.Z"     "tBodyAccJerk.mean.X"   "tBodyAccJerk.mean.Y"  
 "tBodyAccJerk.mean.Z"   "tBodyAccJerk.std.X"    "tBodyAccJerk.std.Y"    "tBodyAccJerk.std.Z"   
 "tBodyGyro.mean.X"      "tBodyGyro.mean.Y"      "tBodyGyro.mean.Z"      "tBodyGyro.std.X"      
 "tBodyGyro.std.Y"       "tBodyGyro.std.Z"       "tBodyGyroJerk.mean.X"  "tBodyGyroJerk.mean.Y" 
 "tBodyGyroJerk.mean.Z"  "tBodyGyroJerk.std.X"   "tBodyGyroJerk.std.Y"   "tBodyGyroJerk.std.Z"  
 "tBodyAccMag.mean"      "tBodyAccMag.std"       "tGravityAccMag.mean"   "tGravityAccMag.std"   
 "tBodyAccJerkMag.mean"  "tBodyAccJerkMag.std"   "tBodyGyroMag.mean"     "tBodyGyroMag.std"     
 "tBodyGyroJerkMag.mean" "tBodyGyroJerkMag.std"  "fBodyAcc.mean.X"       "fBodyAcc.mean.Y"      
 "fBodyAcc.mean.Z"       "fBodyAcc.std.X"        "fBodyAcc.std.Y"        "fBodyAcc.std.Z"       
 "fBodyAccJerk.mean.X"   "fBodyAccJerk.mean.Y"   "fBodyAccJerk.mean.Z"   "fBodyAccJerk.std.X"   
 "fBodyAccJerk.std.Y"    "fBodyAccJerk.std.Z"    "fBodyGyro.mean.X"      "fBodyGyro.mean.Y"     
 "fBodyGyro.mean.Z"      "fBodyGyro.std.X"       "fBodyGyro.std.Y"       "fBodyGyro.std.Z"      
"fBodyAccMag.mean"      "fBodyAccMag.std"       "fBodyAccJerkMag.mean"  "fBodyAccJerkMag.std"  
"fBodyGyroMag.mean"     "fBodyGyroMag.std"      "fBodyGyroJerkMag.mean" "fBodyGyroJerkMag.std",
The average measurement for the subject and activity,
Numeric value