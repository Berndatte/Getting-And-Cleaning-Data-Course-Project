---
title: "Getting And Cleaning Data Course Project"
author: "Berndatte Nthambi John"
date: "3/4/2020"
output: html_document
---


## Introduction
### Data

- The project uses eight   data:X_train.txt,X_test.txt,Y_train.txt,Y_test.txt,subject_train.txt,subject_test.txt,features.txt,activity_names.txt,which are all found inside the downloaded data set **UCI HAR Data set**.
- The features.txt contains the variable names of x_train.txt and x_test.txt.
- The activities_labels.txt contains the descriptive names of each activity labels,corresponding to each no. of the y_train.txt and y_test.txt.


## Course Project Introduction

The run.analysis.R script performs data preparation and then 5 steps required as described in the course projects definition.

1.**Downloading the data set**

  - Data set was downloaded and extracted under the folder called *UCI HAR Data set*
  
2.**Assigning each data frame to variables**

  - features <- features.txt :561 observations and 2 variables:List of all features
  
  - activities_names <- activities_labels.txt,which contains 6 rows and 2 columns:links the class labels with their activity name.
  
  - subject_test <- subject_test.txt,containing 2947 rows,1 variable:containing test data of 9/30 volunteer test subjects being observed.
  
  - Xtest <- x_test.txt,containing 2947rows,561 columns.test set
  
  - Ytest <- y_test.txt,2947 rows,1 column.test labels
  
  - subject_train<- subject_train.txt,containing 7352 rows,1 variable:containing train data of 21/30 volunteer train subjects being observed.
  
  - Xtrain <- x_train.txt,containing 7352 rows,561 columns.training set
  
  - Ytrain <- y_train.txt, containing 7352 rows, 1 column.Training labels.

3.**Merging the training and the test sets to create one data set.**

    - Xtrain(7352rows,563 cols) is created by merging Xtrain,Ytrain and subject_train using *cbind()* function and then renaming the Ytrain variable to activities and subject_train variable to participants.
    
    - Xtest (2947 rows,563 cols) is created by merging Xtest,Ytest and subject_test using *cbind()*function and then renaming the Ytest variable to activities and subject_test variable to participants.
    
    - master_Data(10299 rows,563 cols) is created by merging Xtest and Xtrain using *rbind()* function.
    
4.**Extracting only the measurements on the mean and standard deviation for each measurement.**

   - myData(10299 rows,88 columns)is created by subsetting master_Data, selecting columns:participants,activities and the columns containing "mean" and "std" for each measurement.
   
5.**Using descriptive activity names to name the activities in the data set**

   - The entire numbers in the activities column of myData replaced by the corresponding  activity from the second column of the activities _names data.
   
6.**Appropriately labeling the data set with descriptive variable names**

   - All "Acc" in column names replaced by "Accelerator"
   - All "Gyro" in column names replaced by "Gyroscope"
   - All "BodyBody" in column names replaced by "Body"
   - All "Mag" in column names replaced by "Magnitude"
   - All start with "f" in column names replaced by "Frequency"
   - All start with "t" in columns names replaced by "Time"
   - ALL "tBody" in column names replaced by "TimeBody"
   - All "angle" in column names replaced by "Angle"
   
7.**Creating a Second,independent  tidy data set with average of each variable of activity and subject.**

   - FinalData(180 rows,88 cols)is created by summarizing myData by taking the means of each variable for each activity and subject after grouped by activities and participants.
   
   - Export FinalData to FinalData.txt file.
   

  

