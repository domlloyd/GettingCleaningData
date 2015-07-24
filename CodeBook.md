# Code book

This code book describes the tidy data set which is output by the programme run_analysis.R contained in this Github repository. In order to run the programme you will need the raw data described below. 

## Raw Data
The source of raw data is data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the raw data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## File layout of tidy data file
The tidy data will be produced to a file called AggregatedTidySamsungData in your R working directory.

The file has taken the raw data and done the following tasks to obtain the tidy data set. 

1. All 30 test subjects in the raw data were divided between files called test and train. These files have been merged to bring together the observations for all 30 test subjects. (10,299 observations) 

2. The raw data contained the sensor measurements (561 measurements), activity (walking, sitting down), and test subject in different files. These columns were merged together in to one data set. 

3. The final data set only contains the variables from this set which relate to mean and std variables. 

4. The column headings (variable names) have been given meaningful names. The number appended to each variable name corresponds to the relative variable sequence in the raw data file. 

5. The final data set is aggregated by subject and activity producing only the mean of each variable for the subject/activity shown, e.g. for subject 1 and activity WALKING there will be one line containing the mean of all relevant measurements. 

## Variable names in the tidy file
The following variables occur in the tidy file. As mentioned previously, the number appended to each variable corresponds to the variable position in the raw data file.

SUBJECT

ACTIVITY

tBodyAcc_mean_X_1
tBodyAcc_mean_Y_2
tBodyAcc_mean_Z_3
tGravityAcc_mean_X_41
tGravityAcc_mean_Y_42
tGravityAcc_mean_Z_43
tBodyAccJerk_mean_X_81
tBodyAccJerk_mean_Y_82
tBodyAccJerk_mean_Z_83
tBodyGyro_mean_X_121
tBodyGyro_mean_Y_122
tBodyGyro_mean_Z_123
tBodyGyroJerk_mean_X_161
tBodyGyroJerk_mean_Y_162
tBodyGyroJerk_mean_Z_163
tBodyAccMag_mean_201
tGravityAccMag_mean_214
tBodyAccJerkMag_mean_227
tBodyGyroMag_mean_240
tBodyGyroJerkMag_mean_253
fBodyAcc_mean_X_266
fBodyAcc_mean_Y_267
fBodyAcc_mean_Z_268
fBodyAcc_meanFreq_X_294
fBodyAcc_meanFreq_Y_295
fBodyAcc_meanFreq_Z_296
fBodyAccJerk_mean_X_345
fBodyAccJerk_mean_Y_346
fBodyAccJerk_mean_Z_347
fBodyAccJerk_meanFreq_X_373
fBodyAccJerk_meanFreq_Y_374
fBodyAccJerk_meanFreq_Z_375
fBodyGyro_mean_X_424
fBodyGyro_mean_Y_425
fBodyGyro_mean_Z_426
fBodyGyro_meanFreq_X_452
fBodyGyro_meanFreq_Y_453
fBodyGyro_meanFreq_Z_454
fBodyAccMag_mean_503
fBodyAccMag_meanFreq_513
fBodyBodyAccJerkMag_mean_516
fBodyBodyAccJerkMag_meanFreq_526
fBodyBodyGyroMag_mean_529
fBodyBodyGyroMag_meanFreq_539
fBodyBodyGyroJerkMag_mean_542
fBodyBodyGyroJerkMag_meanFreq_552
angletBodyAccMean,gravity_555
angletBodyAccJerkMean,gravityMean_556
angletBodyGyroMean,gravityMean_557
angletBodyGyroJerkMean,gravityMean_558
angleX,gravityMean_559
angleY,gravityMean_560
angleZ,gravityMean_561
tBodyAcc_std_X_4
tBodyAcc_std_Y_5
tBodyAcc_std_Z_6
tGravityAcc_std_X_44
tGravityAcc_std_Y_45
tGravityAcc_std_Z_46
tBodyAccJerk_std_X_84
tBodyAccJerk_std_Y_85
tBodyAccJerk_std_Z_86
tBodyGyro_std_X_124
tBodyGyro_std_Y_125
tBodyGyro_std_Z_126
tBodyGyroJerk_std_X_164
tBodyGyroJerk_std_Y_165
tBodyGyroJerk_std_Z_166
tBodyAccMag_std_202
tGravityAccMag_std_215
tBodyAccJerkMag_std_228
tBodyGyroMag_std_241
tBodyGyroJerkMag_std_254
fBodyAcc_std_X_269
fBodyAcc_std_Y_270
fBodyAcc_std_Z_271
fBodyAccJerk_std_X_348
fBodyAccJerk_std_Y_349
fBodyAccJerk_std_Z_350
fBodyGyro_std_X_427
fBodyGyro_std_Y_428
fBodyGyro_std_Z_429
fBodyAccMag_std_504
fBodyBodyAccJerkMag_std_517
fBodyBodyGyroMag_std_530
fBodyBodyGyroJerkMag_std_543

