# GettingCleaningData repository


## Introduction
This repository contains the course assignment for the "Getting and Cleaning Data" module of the John Hopkins
Data Science specialization on Coursera.org. 

As part of the assignment a raw data file of Samsung smart phone data tests was processed to create a tidy 
data set. 

The repository contains: 
* an R script called run_analysis.R for reading the raw data and creating the tidy data set txt file
* a code book which describes the prepared txt file containing the tidy data set

## More information about the raw data and the tests it represents
More information about the data can be found at the following links. 
For information about how the data was produced: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

To download the raw data needed by the run_analysis.R programme:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Specification for run_analysis.R
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set (e.g. WALKING, WALKING DOWNSTAIRS)
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Running the programme
1. Download the Raw data from the above link and unzip it to your R working directory. 
2. Execute run_analysis.R
3. A tidy data set will be prepared in the working directory in a file called AggregatedTidySamsungData.txt
