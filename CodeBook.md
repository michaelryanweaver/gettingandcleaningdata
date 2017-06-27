## Code Book

This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.

## Data source information

This project uses data from the Human Activity Recognition Using Smartphones Data Set.

### Study description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the ti

### Source files used:

* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Processing steps

1. The source files used (listed above) are read into data frames and the training and the test data are combined to create one data set.
2. A new dataset is created by extracting only the measurements on the mean and standard deviation for each measurement, along with the subject and activity ids.
3. Descriptive activity names from the activity_labels.txt file are used to replace the activityIds in the data set.
4. The other field labels in the data set with abbreviations are replaced with descriptive variable names.
5. From the data set in step 4, an independent tidy data set with the average of each variable for each activity and each subject is created.  This data set is then exported to a text file.