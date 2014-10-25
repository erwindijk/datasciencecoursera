### COURSE COURSERA PROJECT - GETTING AND CLEANING DATA
# Create this R script called run_analysis.R that does the following: 
# 1. Merges the training and the test sets to create one data set.
# 2. Uses descriptive activity names to name the activities in the data set
# 3. Appropriately labels the data set with descriptive variable names. 
# 4. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

# Get the dataset: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Stored in "./UCI HAR Dataset/"
# - 'features.txt': List of all features.
# - 'activity_labels.txt': Links the class labels with their activity name.
# - 'train/X_train.txt': Training set.
# - 'train/y_train.txt': Training labels.
# - 'test/X_test.txt': Test set.
# - 'test/y_test.txt': Test labels.exit

path_info <- "./UCI HAR Dataset/"
path_train <- "./UCI HAR Dataset/train/"
path_test <- "./UCI HAR Dataset/test/"

# Read data into R

# Read in features 561 = column labels for X_train and X_test 
# Read in activity_labels 6 for y_train and y_test
features <- read.csv(paste0(path_info, "features.txt"), sep=" ", header = FALSE)
activity_labels <- read.csv(paste0(path_info, "activity_labels.txt"), sep=" ", header = FALSE)

# Read in train data
subject_train <- read.csv(paste0(path_train, "subject_train.txt"), sep=" ", header = FALSE)
X_train <- read.fwf(paste0(path_train, "X_train.txt"), widths = rep(16,561), header = FALSE)
y_train <- read.csv(paste0(path_train, "y_train.txt"), sep=" ", header = FALSE)

# Read in test data
subject_test <- read.csv(paste0(path_test, "subject_test.txt"), sep=" ", header = FALSE)
X_test <- read.fwf(paste0(path_test, "X_test.txt"), widths = rep(16,561), header = FALSE)
y_test <- read.csv(paste0(path_test, "y_test.txt"), sep=" ", header = FALSE)

library(plyr)
library(dplyr)

# 1. Merge train and test sets to create one data set
# 2. Uses descriptive activity names to name the activities in the data set
# 3. Appropriately labels the data set with descriptive variable names. 

# X_total, Add column labels all lowercase
X_total <- rbind(X_train, X_test)
features_lowercase <- tolower(features[,2])
names(X_total) <- features_lowercase

# y_total, add corresponding activity label to activity number
y_total <- rbind(y_train, y_test)
names(y_total) <- "act_nr"
names(activity_labels) <- c("nr", "activity")
y_total <- mutate(y_total, activity = activity_labels$activity[y_total$act_nr])

# subject_total, add column labels
subject_train <- cbind(subject_train, "train")
names(subject_train) <- c("person", "role")
subject_test <- cbind(subject_test, "test")
names(subject_test) <- c("person", "role")
subject_total <- rbind(subject_train, subject_test)

# combine all variables for each observation into one row in one table dataset_total
dataset_total <- cbind(subject_total, y_total$activity, X_total)
names(dataset_total)[3] <- "activity"
all(colSums(is.na(dataset_total))==0)      # check no NA

# 4. Extracts only the measurements on the mean and standard deviation for each measurement.
subset_columns <- sort(c(1, 2, 3, grep("mean", names(dataset_total)), grep("std", names(dataset_total))))
data_subset <- dataset_total[,subset_columns]
cnames <- names(data_subset)
cnames <- gsub("\\)", "", cnames); cnames <- gsub("\\(", "", cnames); 
cnames <- gsub("-", "_", cnames); cnames <- gsub(" ", "", cnames)
cnames <- gsub(",", "", cnames)
names(data_subset) <- cnames
# write.table(data_subset, file="data_subset.txt", row.name=FALSE)


# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
result_means <- data_subset %>% group_by(person, activity) %>% summarise_each(funs(mean))


# 6. Write data to text file
write.table(result_means, file="resulting_averages.txt", row.name=FALSE)


# Tidy data:
# 1. Each variable you measure should be in one column
# 2. Each different observation of that variable should be in a different row
# 3. There should be one table for each "kind" of variable
# 4. If you have multiple tables, they should include a column that allows them to be linked


