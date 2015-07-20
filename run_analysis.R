# this script uses the "dplyr" library so load it here
library("dplyr")
# use Hadley Wickham "readr" library for fast reading of files using read_table
library("readr")

# the raw data has been unzipped to a local directory
# so let's set the working directory appropriately
setwd ("c:\\users\\dlloyd\\desktop\\UCIHARDataset")

# first we will read the features.txt file in order to get the column number
# and column name. This will be required when we need column names for our tidy data set
# store the result in the variable variable_list
variable_list <- read.csv("features.txt",header=FALSE,sep=" ",col.names=c('column_num','column_desc'))

# read the test and train data sets and store the results in 2 variables
# testset and trainset respectively
trainset <- read_table("train\\X_train.txt",col_names = FALSE)
testset <- read_table("test\\X_test.txt",col_names = FALSE)

# merge the two data sets using rbind and store the result in mergedset
mergedset <- rbind(trainset,testset)
