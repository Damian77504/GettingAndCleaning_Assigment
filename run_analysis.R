
#Data source:
# A full description is available at the site where the data was obtained:
#                http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Here are the data for the project:
#                https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


#Data URL
Data_Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Download and extract Zip file
download.file(Data_Url, destfile = "data.zip")
unzip("data.zip")

#1. Merges the training and the test sets to create one data set

#Set activity and feature labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") 
features <- read.table("./UCI HAR Dataset/features.txt")               

#Set test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

#Set train data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

#Merge subjects, activity labels, and features into test set
data_test  <- cbind(subject_test, y_test, X_test)

#Merge subjects, activity labels, and features into train set
data_train <- cbind(subject_train, y_train, X_train)

#Merge test data and train data into one data set
data_all <- rbind(data_test, data_train)


#2. Extracts only the measurements on the mean and standard deviation for each measurement

names_all <- c("Subject", "Activity", as.character(features$V2))  #all names including subject and activity columns
mean_std_select <- grep("Subject|Activity|[Mm]ean|[Ss]td", names_all, value = FALSE)  #select subject, activity, "mean" and "std" 
data_subset <- data_all[ ,mean_std_select]  #subset data set 


#3. Uses descriptive activity names to name the activities in the data set

#Read labels from the activity_labels.txt file
names(activity_labels) <- c("activityNumber", "activityName")
data_subset$V1.1 <- activity_labels$activityName[data_subset$V1.1]


#4. Appropriately labels the data set with descriptive variable names

#Use series of substitutions to rename variables
descriptive_names  <- names_all[mean_std_select]    # apply names after sub-setting
descriptive_names  <- gsub("^t", "Time", descriptive_names)
descriptive_names  <- gsub("^f", "Frequency", descriptive_names)
descriptive_names  <- gsub("Acc", "Accelerometer", descriptive_names)
descriptive_names  <- gsub("Gyro", "Gyroscope", descriptive_names)
descriptive_names  <- gsub("Mag", "Magnitude", descriptive_names)
descriptive_names  <- gsub("mean", "Mean", descriptive_names)
descriptive_names  <- gsub("std", "StdDev", descriptive_names)
descriptive_names  <- gsub("gravity", "Gravity", descriptive_names)
descriptive_names  <- gsub("angle", "Angle", descriptive_names)
descriptive_names  <- gsub("[[:punct:]]", "", descriptive_names)
names(data_subset) <- descriptive_names   # apply new descriptive names to the subset


#5. From the data set in step 4, creates a second, independent tidy data set with 
#   the average of each variable for each activity and each subject

#Create tidy data set by activity and by subject
data_tidy <- data_subset %>% group_by(Subject, Activity) %>% summarise_all(list(mean))

#Write tidy data to output file
write.table(data_tidy, file = "Tidy_Data.txt", row.names = FALSE)




