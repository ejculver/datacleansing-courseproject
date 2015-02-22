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