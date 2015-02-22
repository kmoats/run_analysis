library(plyr)
library(stringr)
library(data.table)

# Download and unzip data files
if(!file.exists("run_data.zip")) {
        file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        print("Downloading data files")
        download.file(file_url, destfile = "run_data.zip", method = "curl")
        date_downloaded <- date()
        unzip("run_data.zip")
} else {
        cat("Data files already downloaded on", date_downloaded)
}


# 1. Merge the training and the test sets to create a single data frame named "run_data".

# Read each test data file and cbind into a data frame named "test_data"
# The first column is named "SubjectID", the second column is named "Activity" 
# and the remaining columns are named using the variables listed in the features.txt file
test_data1 <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(test_data1) <- "SubjectID"
test_data2 <- read.table("UCI HAR Dataset/test/y_test.txt")
names(test_data2) <- "Activity"
test_data3 <- read.table("UCI HAR Dataset/test/X_test.txt")
names(test_data3)<- read.table("UCI HAR Dataset/features.txt")[,2]
test_data <-cbind(test_data1, test_data2, test_data3)

# Read each train data file and cbind into a data frame named "train_data".  
# The first column is named "SubjectID", the second column is named "Activity" 
# and the remaining columns are named using the variables listed in the features.txt file
train_data1 <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(train_data1) <- "SubjectID"
train_data2 <- read.table("UCI HAR Dataset/train/y_train.txt")
names(train_data2) <- "Activity"
train_data3 <- read.table("UCI HAR Dataset/train/X_train.txt")
names(train_data3)<- read.table("UCI HAR Dataset/features.txt")[,2]
train_data <-cbind(train_data1, train_data2, train_data3)

#rbind the "test_data" and "train_data" data frames together to form the "run_data" data frame
run_data <- rbind(test_data, train_data)


# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

# Subset to columns whose names contain the strings "mean()" and "std()" for each variable.  
# The resulting data frame is named "mean_std_data"
mean_indices <- grep("mean()", names(run_data), fixed = TRUE)
std_indices <- grep("std()", names(run_data), fixed = TRUE)
mean_std_data <- cbind(run_data[,1:2], run_data[,sort(c(mean_indices, std_indices))])

# Sort the "mean_std_data" data frame by SubjectID (1-30) and Activity (1-6)
mean_std_data <- arrange(mean_std_data, mean_std_data$SubjectID, mean_std_data$Activity)


# 3. Use descriptive activity names to name the activities in the data set
# Convert Activity from numbers (1-6) to character vectors (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
# by reading in the activity names from the activity_labels.txt file
activity_name <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
mean_std_data$Activity <- activity_name[mean_std_data$Activity]


# 4. Appropriately label the data set with descriptive variable names. 
# Variable names have already been set according to those listed in the features.txt file (see step 1 above).
# Here, we remove the "()" characters from those variable names.
names(mean_std_data) <- str_replace_all(names(mean_std_data), "([()])", "")


# 5. From the data set in step 4, create a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
tidy_data <- mean_std_data
tidy_data.dt <- data.table(tidy_data)
tidy_data <- tidy_data.dt[,lapply(.SD,mean),by=c("SubjectID","Activity"),.SDcols=3:ncol(tidy_data)]


# Save the data set as a txt file created with write.table() using row.name=FALSE 
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)


# Save the variable names to the CodeBook.md file.  (Add descriptions of the variables in this file later) 
if(!file.exists("CodeBook.md")) {
        write.table(names(tidy_data), file = "CodeBook.md", row.names = FALSE)
}
