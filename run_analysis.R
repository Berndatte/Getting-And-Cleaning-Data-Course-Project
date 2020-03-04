filename <- "Coursera_projectfiles.zip"

#downloading the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,filename,method = "curl")

#checking if folder exists
if(!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

library(data.table)
#Assigning all the data frames
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities_names <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code","activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
Ytest <- read.table("UCI HAR Dataset/test/Y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
Ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt", col.names = "code")

Xtrain$activities <- Ytrain[, 1]
Xtrain$participants <- subject_train[, 1]
Xtest$activities <- Ytest[, 1]
Xtest$participants <- subject_test[, 1]



#ASSIGNMENT 1:merging the training and test sets to one data set
master <-rbind(Xtrain,Xtest)

#ASSIGNMENT 2:extracting only the measurements on the mean and standard deviation for each measurement.
library(dplyr)
myData <-master %>% 
  select(participants,activities,contains("mean"), contains("std"))

#ASSIGNMENT 3:using descriptive activity names to name the activities in the data set
myData$activities <- activities_names[myData$activities,2]

#ASSIGNMENT 4:appropriately labeling the data set with descriptive variables names
names(myData)
names(myData) <- gsub("Acc","Accelerator",names(myData))
names(myData) <- gsub("Gyro","Gyroscope",names(myData))
names(myData) <- gsub("BodyBody","Body",names(myData))
names(myData) <- gsub("Mag","Magnitude",names(myData))
names(myData) <- gsub("^t","Time",names(myData))
names(myData) <- gsub("^f","Frequency",names(myData))
names(myData) <- gsub("tBody","TimeBody",names(myData))
names(myData) <- gsub("angle","Angle",names(myData))

#ASSIGNMENT 5:Creating a second,independent tidy data set with the average of each variable for each activity and each subject
FinalData <- myData%>%
  group_by(participants,activities)%>%
  summarise_all(funs(mean))

write.table(FinalData,file = "FinalData.txt",row.name = FALSE)
str(FinalData)

FinalData
