import.package(dplyr)
library(dplyr)

## download zip file, unzip and remove zip (temp) file
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "temp.zip", method="curl")
unzip('temp.zip')
file.remove('temp.zip')

## investigate
# list.files("./UCI HAR Dataset")
# list.files("./UCI HAR Dataset/test")
# list.files("./UCI HAR Dataset/train")

### STEP 1

## data files needed for merging
## test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") #2947 X 1
test_features <- read.table("./UCI HAR Dataset/test/X_test.txt") #2947 x 561
test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt") #2947 X 1
## train data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") #7352 X 1
train_features <- read.table("./UCI HAR Dataset/train/X_train.txt") #7352 X 561
train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt") #7352 X 1

## merged *test* data
test_data <- cbind(subject_test, test_activity, test_features)

## merged *train* data
train_data <- cbind(subject_train, train_activity, train_features)

## combined full data (test + train)
full_data <- rbind(test_data, train_data) #10299 X 563

## features (X data) name & column names for the full data 
features <- read.table("./UCI HAR Dataset/features.txt")
features_name <- features$V2 #561
# head(features_name)
colnames(full_data) <- c("subject", "activity", features_name)

### STEP 2

## subset the data to include only mean and std variables (columns)
mean_std_column_positions <- grep("(mean|Mean|std)", features_name)
mean_std_column_names <- features_name[mean_std_column_positions]
subset_data <- subset(full_data, select=c("subject", "activity", mean_std_column_names)) #10299 X 88

### STEP 3

## descriptive names for activity (Y data)) numbers between 1 - 6. 
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
# head(activity)
subset_data$activity <- activity[subset_data$activity, 2]

### STEP 4

## descriptive names for variables (mean_std_column_names)
mean_std_column_descriptive_names <- gsub("tBody", "TimeBody", mean_std_column_names)
mean_std_column_descriptive_names <- gsub("^tGravity", "TimeGravity", mean_std_column_descriptive_names)
mean_std_column_descriptive_names <- gsub("^f", "Frequency", mean_std_column_descriptive_names)
mean_std_column_descriptive_names <- gsub("Acc", "Accelerometer", mean_std_column_descriptive_names)
mean_std_column_descriptive_names <- gsub("Gyro", "Gyroscope", mean_std_column_descriptive_names)
mean_std_column_descriptive_names <- gsub("Mag", "Magnitude", mean_std_column_descriptive_names)
colnames(subset_data) <- c("subject", "activity", mean_std_column_descriptive_names)

### STEP 5

## take means for subject & activity

subset_data$subject <- factor(subset_data$subject)
subset_data$activity <- factor(subset_data$activity)

final_data <- subset_data %>%
  group_by(subject, activity) %>%
  summarize_all(list(mean))

write.table(final_data, "final_data.txt", sep = "\t")
