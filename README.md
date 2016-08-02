# Getting-and-Cleaning-Data-Course-Project
Introduction
------------
This is the final project of the Getting and Cleaning Data Course.
About the raw data
------------------
Here are the raw data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
About the script and the tidy dataset
------------
The script, `run_analysis.R`, would function in the following ways:

  1.Download the material and unzip the file.
  
  2.Load the information of subjects and activities
  
  3.Merge the training and the test sets to create one data set
  
  4.Extract only the measurements on the mean and standard deviation for each measurement
  
  5.Convert the `subject`and `activity` columns into factors.
  
  6.Create a tidy data set with the average of each variable for each activity and each subject
  
The output is written in the file named `tidydata.txt`.
About the code book
------------------
You can go to the code book `CodeBook.md` for descriptions of the variables.
