---
title: "README"
author: "erwindijk"
date: "Sunday, October 26, 2014"
---

### COURSERA PROJECT - GETTING AND CLEANING DATA  
R script run_analysis.R https://github.com/erwindijk/datasciencecoursera/blob/master/run_analysis.R  
Cookbook: <insert link here>


**Summary**
```
run_analysis.R does the following:   
1. Merges the training and the test sets to create one data set.  
2. Uses descriptive activity names to name the activities in the data set  
3. Appropriately labels the data set with descriptive variable names.   
4. Extracts only the measurements on the mean and standard deviation for each measurement.   
5. From the data set in step 4, creates a second, independent tidy data set 
   with the average of each variable for each activity and each subject.  
```

**Get the dataset, store it and read it in**   

Get dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip    
Store the folder "./UCI HAR Dataset/" in the Zip file including subdirectories in your working directory:   
- 'features.txt': List of all features.  
- 'activity_labels.txt': Links the class labels with their activity name.  
- 'train/X_train.txt': Training set.  
- 'train/y_train.txt': Training labels.  
- 'test/X_test.txt': Test set.  
- 'test/y_test.txt': Test labels.exit  

Read data into R  

Read in features 561 = column labels for X_train and X_test  
Read in activity_labels 6 for y_train and y_test

Read in train data  
Read in test data  
  
Load libraries for cleaning up dataset with:
'r library(plyr); library(dplyr)'  

**1. Merge train and test sets to create one data set  
2. Uses descriptive activity names to name the activities in the data set  
3. Appropriately labels the data set with descriptive variable names.**   
  
Merge X_train and X_test into X_total, add column labels, all lowercase, 
clean up columns names with gsub() 

Merge y_train and y_test into y_total, add corresponding activity label 
from activity_labels to activity number in y_total  

Merge subject_train and subject_test into subject_total, add column labels  
combine all variables for each observation into one row in one table dataset_total.  

** 4. Extract only the measurements on the mean and standard deviation for each measurement.**  

** 5. From the data set in step 4, creates a second, independent tidy data set 
   with the average of each variable for each activity and each subject.**   
   
** 6. Write data to text file:** `r write.table(result_means, file="resulting_averages.txt", row.name=FALSE)`


