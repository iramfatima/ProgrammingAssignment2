==================================================================
Assignment for Data Cleaning based on Human Activity Recognition Using Smartphones Dataset
==================================================================

The data cleaning and summarization has been done on the based on the four steps mentioned in the assignment task. The main steps are listed below and also mentioned as comments in the R file.

Fisrt of all, I read the the test data file from the working directory of R Studio.
Read the feature file from the dataset
Assign colnames to testdata from features files so each column of the dataset can have meaningfull column name
Read activity file of test data in order to combine the data into one file
Read subject file of test data in orer to combine the data into one file
Combine the Subjectid, activity id and testdata into one dataframe 
Read the train data file
Assign namess to columns from features files so each column of the dataset can have meaningfull column name
Read activity file of train data in order to combine the data into one file
Read subject file of train data in order to combine the data into one file
Combine Subjectid, activity id and the train data into one data frame
Combined the test and train data into one data frame
Step one of assignment has been accoplised at this stage
Find the columns that are only have mena and standard
Extract only mean and std from the combined dataset
Step two of assignment has been accoplised at this stage
Replace the activity ID with the activity Lable
Step three of assignment has been accoplised at this stage
Take average of each variable for each activity and each subject
Step four of assignment has been accoplised at this stage
Write the final data on the disk inorder to upload it for submission