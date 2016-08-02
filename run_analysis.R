#Download and unzip the dataset
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename<-"dataset.zip"
library(downloader)
if(!file.exists(filename)) download(url,filename)
unzip(filename)


#Merges the training and the test sets to create one data set
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train <- read.table("UCI HAR Dataset/train/X_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
test <- cbind(testSubjects, testActivities, test)

mergeddata <- rbind(train, test)

#Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWantedNames<-features[featuresWanted,2]
featuresWantedNames<-gsub("-mean", "Mean", featuresWantedNames)
featuresWantedNames<-gsub("-std", "Std", featuresWantedNames)
featuresWantedNames<-gsub("-mean", "Mean", featuresWantedNames)
featuresWantedNames<-gsub("[-()]", "", featuresWantedNames)

mergeddata<-mergeddata[,c(1,2,featuresWanted+2)]
colnames(mergeddata) <- c("subject", "activity", featuresWantedNames)


activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
mergeddata$activity<-factor(mergeddata$activity,levels = activityLabels[,1],labels = activityLabels[,2])
mergeddata$subject<-as.factor(mergeddata$subject)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidydata<-aggregate(mergeddata,by=list(subject=mergeddata$subject,activity=mergeddata$activity),mean)
tidydata[,4]<-NULL
tidydata[,3]<-NULL
write.table(tidydata,file = "tidydata.txt",row.name=FALSE)
