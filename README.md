# run_analysis

The run_analysis.R code does the following:


0. Download the run data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and unzip the files.


1. Merge the training and the test sets to create a single data frame named "run_data".

Read each of the follwing test data files and cbind into a data frame named "test_data":
"UCI HAR Dataset/test/subject_test.txt"
"UCI HAR Dataset/test/y_test.txt"
"UCI HAR Dataset/test/X_test.txt"

Read each of the following train data files and cbind into a data frame named "train_data":
"UCI HAR Dataset/train/subject_train.txt"
"UCI HAR Dataset/train/y_train.txt"
"UCI HAR Dataset/train/X_train.txt"

rbind the "test_data" and "train_data" data frames together to form the "run_data" data frame.
Variable names were set according to those listed in the "UCI HAR Dataset/test/features.txt" file.


2. Extract only the measurements on the mean and standard deviation for each measurement. 

Subset the "run_data" data frame to include only columns whose names contain the strings "mean()" and "std()" for each variable.  The resulting data frame is named "mean_std_data" and is then sorted by SubjectID (1-30) and Activity (1-6).


3. Use descriptive activity names to name the activities in the data set.

Values in the Activity column are converted from integers (1-6) to character vectors ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING") by reading in the activity names from the "UCI HAR Dataset/activity_labels.txt" file.


4. Appropriately label the data set with descriptive variable names. 

Variable names were already set according to those listed in the features.txt file (see step 1 above).
Here, we remove the unecessary "()" characters from those variable names.
See "CodeBook.md" for a summary and description of these variables.


5. From the data set in step 4, create a second, independent tidy data set 
    with the average of each variable for each activity and each subject.

lapply was used to calculate the mean of each variable for each Activity and SubjectID.  
The resulting tidy data set has 68 columns (SubjectID, Activity and 66 accelerometer/gyroscope variables) and 180 observations (30 Subject IDs * 6 Activities).


6. Save the tidy data set as a txt file named "tidy_data.txt", created with write.table() using row.name=FALSE. 


7. Save the variable names to the "CodeBook.md" file, created with write.table() using row.name=FALSE.  Descriptions of these variables were manually entered later.