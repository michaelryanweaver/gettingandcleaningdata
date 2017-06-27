##run_analysis.R
##Download and unzip the file
fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="Dataset.zip", method="curl")
unzip("Dataset.zip", overwrite = TRUE,exdir = ".")

setwd("./UCI HAR Dataset/")

##Merge the training and the test sets to create one data set.
#create tables from txt files
features  <- read.table("./features.txt",header=FALSE)
activity_labels <- read.table("./activity_labels.txt",header=FALSE)
subject_train <- read.table("./train/subject_train.txt", header=FALSE)
x_train <- read.table("./train/X_train.txt", header=FALSE)
y_train <- read.table("./train/y_train.txt", header=FALSE)
subject_test <- read.table("./test/subject_test.txt", header=FALSE)
x_test <- read.table("./test/X_test.txt", header=FALSE)
y_test <- read.table("./test/y_test.txt", header=FALSE)

#apply column names
colnames(activity_labels)<-c("activityId","activityType")
colnames(subject_train) <- "subject"
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityId"
train <- cbind(y_train,subject_train,x_train)
colnames(subject_test) <- "subject"
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityId"
test <- cbind(y_test,subject_test,x_test)

#combine test and train data
data <- rbind(train,test)

##Extract only the measurements on the mean and standard deviation for each measurement.
data_subset <-data[,grepl("mean|std|subject|activity",colnames(data))]

##Use descriptive activity names to name the activities in the data set
library(plyr)

data_subset <- join(data_subset, activity_labels, by = "activityId", match = "first")

data_subset <-data_subset[,-1]

##Appropriately label the data set with descriptive variable names.
names(data_subset) <- gsub("Acc", "Acceleration", names(data_subset))
names(data_subset) <- gsub("^t", "Time", names(data_subset))
names(data_subset) <- gsub("^f", "Frequency", names(data_subset))
names(data_subset) <- gsub("BodyBody", "Body", names(data_subset))
names(data_subset) <- gsub("mean", "Mean", names(data_subset))
names(data_subset) <- gsub("std", "StDev", names(data_subset))
names(data_subset) <- gsub("Freq", "Frequency", names(data_subset))
names(data_subset) <- gsub("Mag", "Magnitude", names(data_subset))

##Create a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata<- ddply(data_subset, c("subject","activityType"), numcolwise(mean))
setwd("../")
write.table(tidydata,file="tidydata.txt")