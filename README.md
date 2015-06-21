# Getting-Cleaning-Data
peer assessment for the Coursera course assignment

The instructions for the assignment: 

  You should create one R script called run_analysis.R that does the following. 
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each            activity and each subject.


My implementation:

Step 1
Sets the working directory, loads the features file and extracts the indeces of only the mean and standard deviation data

Step 2
Loads the train and test features and extracts only the subset of data relative to means and standard devs

Step 3
Merges the feature data frames so obtained into one Feature data frame and assigns the names to the columns

Step 4
Reads in and merge the train and test activity data. Then the code extracts the activity labels and links the labels to the activity codes.

Step 5
Extracts the train and test subject data and merges them into one.

Step 6 
Links the subjects to the actvity they have performed

Step 7
Combines the activity, the subject ID and measurements in a single data frame

Step 8
Creates a data frame with the same results as step 7 ordered by subjectID and activity of all measurements.
