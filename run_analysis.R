# This script uses the "dplyr" library for selecting the data set
# Also uses "readr" library for fast reading of files using read_table
library("dplyr")
library("readr")


# the raw data has been unzipped to a local directory
# so let's set the working directory appropriately
setwd ("c:\\users\\dlloyd\\desktop\\UCIHARDataset")



# first we will read the features.txt file in order to get the column number
# and column name. This will be required when we need column names for our tidy data set
# store the result in the variable variable_list
variable_list <- read.csv("features.txt",header=FALSE,sep=" ",col.names=c('column_num','column_desc'),
                          stringsAsFactors = FALSE)



# some of the column names contain unusual unusual characters such as (), 
# so substitute these in the column names by replacing with _ This will greatly simplify
# the selection of columns by an analyst
stripped_colnames <- gsub('[()--,]','_',variable_list$column_desc)

# the column names also contain duplicate values so we will handle that by appending the
# column number to the end of the column name to guarantee uniqueness. If we don't then 
# the readr functions will complain about duplicate column names
colnames <- paste(stripped_colnames,variable_list$column_num,sep='_')

# now we read the RAW data files in order to merge them later on. 
# We will use the column names we have just obtained to describe each "measurements" dataset below.
# we will also read the "activities" and "subjects" datasets to form complete data later with a cbind
train_measurements <- read_table("train\\X_train.txt",col_names = colnames)
train_activities   <- read_table("train\\y_train.txt",col_names = 'ACTIVITY')
train_subjects     <- read_table("train\\subject_train.txt",col_names = 'SUBJECT')

test_measurements <- read_table("test\\X_test.txt",col_names = colnames)
test_activities   <- read_table("test\\y_test.txt",col_names = 'ACTIVITY')
test_subjects     <- read_table("test\\subject_test.txt",col_names = 'SUBJECT')

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

merged_required_vals <- cbind(required_vals_subject,required_vals_mean,required_vals_std)

# now read the activity mappings
activities <- read.table("activity_labels.txt",col.names=c('activity_num','activity_desc'),stringsAsFactors = FALSE)
# and use a for..next loop to replace the activity number in our result with 
# the activity description
#for (i in 1:length(merged_required_vals$ACTIVITY)) {
#  merged_required_vals$ACTIVITY[i] = activities$activity_desc[merged_required_vals$ACTIVITY[i]]
#}



# create the output file of tidy data