---
title: "code_book"
author: "erwindijk"
date: "Sunday, October 26, 2014"
---

For almost any data set, the measurements 
you calculate will need to be described in more detail than you will sneak into the spreadsheet. 
The code book contains this information. At minimum it should contain:

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
- 86 columns with average values per person (subject) and per activity for all mean and stdev values of the experiments





