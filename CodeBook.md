
# CodeBook.md describes the variables, the data, and any transformations or work that were performed to clean up the data.


# Raw data source:
 - A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 - Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Data description:
 - The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
 - The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Variables:
 - features (561 obs. of 2 variables)
 - activity labels (6 obs. of 2 variables)
                   - 1 WALKING
                   - 2 WALKING_UPSTAIRS
                   - 3 WALKING_DOWNSTAIRS
                   - 4 SITTING
                   - 5 STANDING
                   - 6 LAYING
 - subject_test (2947 obs. of 1 variables)
 - X_test (2947 obs. of 561 variables)
 - y_test (2947 obs. of 1 variables)
 - subject_train (7352 obs. of 1 variables)
 - X_train (7352 obs. of 561 variables)
 - y_train (7352 obs. of 1 variables)

# Transformation:
- Merged the training and the test sets to create one data set by using rbind() command 
- Extracted only the measurements on the mean and standard deviation for each measurement. 
- Used descriptive activity names to name the activities in the data set
- Appropriately labeled the data set with descriptive variable names. 
- Created tidy data set with the average of each variable for each activity and each subject.

