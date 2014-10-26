---
title: "code_book"
author: "erwindijk"
date: "Sunday, October 26, 2014"
---

### COURSERA PROJECT - GETTING AND CLEANING DATA  
R script [run_analysis.R](https://github.com/erwindijk/datasciencecoursera/blob/master/run_analysis.R)  
Raw dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Tidy dataset: [course dataset submission](https://s3.amazonaws.com/coursera-uploads/user-8568ffbbb1fd8708f584ae4b/972586/asst-3/1c4712f15c7011e49029c1bf39dd5a90.txt) 


Information about the variables (including units!) in the data set not contained in the tidy data
Information about the summary choices you made
Information about the experimental study design you used

From original dataset:
- 'features.txt': List of all features.  
- 'activity_labels.txt': Links the class labels with their activity name.  
- 'train/X_train.txt': Training set.  
- 'train/y_train.txt': Training labels.  
- 'test/X_test.txt': Test set.  
- 'test/y_test.txt': Test labels.exit 
The resulting
[dataset](https://s3.amazonaws.com/coursera-uploads/user-8568ffbbb1fd8708f584ae4b/972586/asst-3/1c4712f15c7011e49029c1bf39dd5a90.txt) 
consists of following:
- Combined datasets for  X_train and X_test, y_train and y_test, subject_train and subject_test
- Additional column role: role = 1 for train and role = 2 for test
> Description of variables in columns:
- person
- activity
- role
- 86 columns with average values per person (subject) and per activity for all mean and stdev values of the features

**Short description from feature_info.txt**
```
Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals and used for the results are: 
mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
The complete list of variables of each feature vector is available in 'features.txt'
```

