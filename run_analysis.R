# This code performs the tasks required by the assignment of the Getting and Cleaning Data
# Course on Coursera
# The input is a zip file downloaded to my working directory, the output is a txt file with
# the results organised as required (see readme file)

# Step 1
# to set my working directory
setwd("/Users/chiarascabellone/Documents/Getting and Cleaning Data/Assignment/UCI HAR Dataset")

# load features, extract them and subset only the indeces of means and st devs
featureNames <- read.table("features.txt")
ourFeatures <- grep("std|mean", featureNames$V2)

# Step 2
# load train and test features, extract them and subset only means and st devs
trainFeatures <- read.table("train/X_train.txt")
ourTrainFeatures <- trainFeatures[,ourFeatures]
testFeatures <- read.table("test/X_test.txt")
ourTestFeatures <- test.features[,ourFeatures]

# Step 3
# merge the train and test data sets
totalFeatures <- rbind(ourTrainFeatures, ourTestFeatures)
# add column names to the features
colnames(totalFeatures) <- featureNames[ourFeatures, 2]

# Step 4
# Read and merge the train and test activity 
trainActivities <- read.table("train/y_train.txt")
testActivities <- read.table("test/y_test.txt")
totalActivities <- rbind(trainActivities, testActivities)

# extract activity labels and link to activity codes
activityLabels <- read.table("activity_labels.txt")
totalActivities$activity <- factor(totalActivities$V1, levels = activityLabels$V1, labels = activityLabels$V2)

# Step 5
# extract the train and test subject data and merge
trainSubjects <- read.table("train/subject_train.txt")
testSubjects <- read.table("test/subject_test.txt")
totalSubjects <- rbind(trainSubjects, testSubjects)

# Step 6
# link the subjects to their activity
subjectsActivities <- cbind(totalSubjects, totalActivities$activity)
colnames(subjectsActivities) <- c("subjectID", "activity")

# Step 7
# Combine the activity, ID and measurement in a data frame
activityDF <- cbind(subjectsActivities, totalFeatures)

# Step 8
# create an independent tidy data set with the average of each variable 
# for each activity and each subject
result <- aggregate(activityDF[,3:(ncol(activityDF))], by = list(activityDF$subjectID, activityDF$activity), FUN = mean)
colnames(result)[1:2] <- c("subject.id", "activity")
write.table(result, file="mean_results.txt", row.names = FALSE)

