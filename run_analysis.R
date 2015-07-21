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

# now we read the RAW data files in order to merge them. We will use the column names
# we have just obtained to describe each raw dataset and the merged one.
# read the test and train data sets and store the results in 2 variables
# testset and trainset respectively
trainset <- read_table("train\\X_train.txt",col_names = colnames)
testset <- read_table("test\\X_test.txt",col_names = colnames)


# merge the two data sets using rbind and store the result in mergedset
mergedset <- rbind(trainset,testset)


# now that we have all the data it's time to select only the columns required
# by the assignment definition
# select on std and mean columns as requested by the assignment
# store the result in a dataset called required_vals
required_vals_std <- select(mergedset, contains("std", ignore.case = TRUE))
required_vals_mean <- select(mergedset, contains("mean", ignore.case = TRUE))

merged_required_vals <- cbind(required_vals_mean,required_vals_std)

# create the output file of tidy data