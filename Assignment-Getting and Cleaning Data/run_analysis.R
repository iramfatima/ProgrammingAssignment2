#Read the test data file
testdata = read.table("UCI HAR Dataset//test//X_test.txt")
#Read the feature file
feature= read.table("UCI HAR Dataset//features.txt")
col=vector()
col<-t(feature$V2)
#Assign colnames to testdata from features files
colnames( testdata ) <- unlist(col)

#Read activity file of test data
activitytest = read.table("UCI HAR Dataset//test//y_test.txt",header=FALSE, col.names = c("ActivityID"))

#Read subject file of test data
subjecttest = read.table("UCI HAR Dataset//test//subject_test.txt", header=FALSE, col.names = c("SubjectID"))

#Combine the test data and create one data frame
combinetestdata=cbind(subjecttest, activitytest, testdata)


#Read thhe train data file
traindata = read.table("UCI HAR Dataset//train//X_train.txt")
#Assign namess to columns
colnames( traindata ) <- unlist(col)

#Read activity file of train data
activitytrain = read.table("UCI HAR Dataset//train//y_train.txt",header=FALSE, col.names = c("ActivityID"))
#Read subject file of train data
subjecttrain = read.table("UCI HAR Dataset//train//subject_train.txt",header=FALSE, col.names = c("SubjectID"))


#Combine the train data into one data frame
combinetraindata=cbind(subjecttrain, activitytrain, traindata)

#1................................................
#Combined the test and train dat
dataset=rbind(combinetestdata,combinetraindata) # Step 1 of Assignment accomplished



#Find the columns that are only have mena and standard deviation for each measurement
meancol<-grep("mean()", colnames(dataset),value = TRUE, fixed = TRUE)
stdcol<-grep("std()", colnames(dataset),value = TRUE, fixed = TRUE)

#2................................................
#Extract only mean and std from main dataset #Step 2 of the assignment is accomplished
datameanstd<-dataset[,which(colnames(dataset) %in% c("SubjectID","ActivityID", unlist(meancol), unlist(stdcol)))]


activitylabel = read.table("UCI HAR Dataset//activity_labels.txt",header=FALSE, col.names = c("ActivityID", "ActivityLabel"))


#3................................................
#Replace the activity ID with the activity Lable
for(i in 1:nrow(datameanstd)){ 
    for(j in 1:nrow(activitylabel)){
    if(datameanstd$ActivityID[i] == activitylabel$ActivityID[j]){
      datameanstd$ActivityID[i] <- as.character(activitylabel$ActivityLabel[j])
    }
  }
  
}

#4................................................
#Chnage the column name from "AtivityID" to "Performed_Activity" to give descriptive variable names
colnames(datameanstd)[colnames(datameanstd)=="ActivityID"] <- "Performed_Activity"


#5................................................
#Average of each variable for each activity and each subject

library(plyr)
finaldata<-ddply(datameanstd, c("Performed_Activity", "SubjectID"), function(x){
  y <- subset(x, select= c(-Performed_Activity,-SubjectID))
  apply(y, 2, mean)
})

#Write the final data on the disk
write.table(finaldata,"output.txt",sep="\t", row.names=FALSE)

