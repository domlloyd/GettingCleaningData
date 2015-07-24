# This R programme has been created by Dominic Lloyd
# as part of the Coursera Module - Getting and Cleaning Data - July 2015

# It takes a raw data set of Samsung smart phone motion sensor data and tidies
# the data set by producing aggregated mean and std variables for 
# each subject and each activity measured in the data set. 

# This is the link to download the dataset
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# This link describes how the dataset was produced
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# This script uses the "dplyr" library for selecting the data set
# Also uses "readr" library for fast reading of files using read_table
library("dplyr")
library("readr")


# the raw data has been unzipped to our RProject directory
# so the setwd is not needed, as per the coursework instructions
# setwd ("c:\\UCIHARDataset")
# if running this program make sure the raw data as per the readme
# is unzipped to your working directory



# first we will read the features.txt file in order to get the column number
# and column name. This will be required when we need column names for our tidy data set
# store the result in the variable variable_list
variable_list <- read.csv("UCIHARDataset\\features.txt",header=FALSE,sep=" ",col.names=c('column_num','column_desc'),
                          stringsAsFactors = FALSE)



# some of the column names contain unusual unusual characters such as (), 
# so substitute these in the column names by replacing with blank and _ (for hyphens) This will greatly simplify
# the selection of columns by an analyst
stripped_colnames <- gsub('[()]','',variable_list$column_desc)
stripped_colnames <- gsub('[-]','_',stripped_colnames)

# the column names also contain duplicate values so we will handle that by appending the
# column number to the end of the column name to guarantee uniqueness. If we don't then 
# the readr functions will complain about duplicate column names
colnames <- paste(stripped_colnames,variable_list$column_num,sep='_')

# now we read the RAW data files in order to merge them later on. 
# We will use the column names we have just obtained to describe each "measurements" dataset below.
# we will also read the "activities" and "subjects" datasets to form complete data later with a cbind
# NB we are using read.csv to read subjects as we found some problems with using read_table on that file
train_measurements <- read_table("UCIHARDataset\\train\\X_train.txt",col_names = colnames)
train_activities   <- read_table("UCIHARDataset\\train\\y_train.txt",col_names = 'ACTIVITY')
train_subjects     <- read.csv("UCIHARDataset\\train\\subject_train.txt",col.names = 'SUBJECT', header=FALSE)

test_measurements <- read_table("UCIHARDataset\\test\\X_test.txt",col_names = colnames)
test_activities   <- read_table("UCIHARDataset\\test\\y_test.txt",col_names = 'ACTIVITY')
test_subjects     <- read.csv("UCIHARDataset\\test\\subject_test.txt",col.names = 'SUBJECT', header=FALSE)


# replace activity codes with meaningful names from the activity labels file
# first read our activity lookup file
activities <- read.table("UCIHARDataset\\activity_labels.txt",col.names=c('activity_num','activity_desc'),
                         stringsAsFactors = FALSE)

# now do the replacements on each of train_activities and test_activities
# a simple for..next loop will do the trick
for (i in 1:length(activities$activity_desc)) {
  train_activities <- replace(train_activities,train_activities==i,activities$activity_desc[i])
  test_activities  <- replace(test_activities,test_activities==i,activities$activity_desc[i])
}


# now column bind (cbind) each set of train and test variables above
train_all_columns <- cbind(train_subjects,train_activities,train_measurements)
test_all_columns  <- cbind(test_subjects,test_activities,test_measurements)

# merge the complete train and test data sets using rbind and store the result in mergedset
mergedset <- rbind(train_all_columns,test_all_columns)


# now that we have all the data it's time to select only the columns required
# by the assignment definition. We will also include the subject id and the activity id then
# select on std and mean columns as requested by the assignment
# store the result in a dataset called required_vals
# NB we will NOT exclude meanFreq variables because they contain the word "mean"
required_vals_subject <- select(mergedset, SUBJECT, ACTIVITY)
required_vals_std <- select(mergedset, contains("std", ignore.case = TRUE))
required_vals_mean <- select(mergedset, contains("mean", ignore.case = TRUE))
# This is the MAIN DATA SET with the observations and variables we need
merged_required_vals <- cbind(required_vals_subject,required_vals_mean,required_vals_std)


# create the output file of tidy data aggregating the mean of each variable
# we need to summarise for each subject by each activity the mean of all variables
tidy_set_by_subject_activity <- merged_required_vals %>%
  group_by(SUBJECT, ACTIVITY) %>%
  arrange(SUBJECT,ACTIVITY) %>%
  summarise_each(funs(mean))


# the following files can be uncommented as necessary to produce the file shown - good for debugging!
# write.table(merged_required_vals, file='TidySamsungData.txt', row.names = FALSE)
# write.table(required_vals_subject, file='Subjects.txt', row.names = FALSE)
# write.table(train_subjects, file='TrainSubjects.txt', row.names = FALSE)
# write.table(test_subjects, file='TestSubjects.txt', row.names = FALSE)


# now write out the tidy_set_by_subject_activity data set to a txt file using write.table
# and row.names = FALSE
write.table(tidy_set_by_subject_activity, file='AggregatedTidySamsungData.txt', row.names = FALSE)

