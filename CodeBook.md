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

Variable Name | Variable Description
--------------|---------------------
SUBJECT | A number 1-30 representing each of the 30 test subjects.  
ACTIVITY | 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING  
tBodyAcc_mean_X_1 | time domain (50Hz capture) body acceleration x-axial - mean  
tBodyAcc_mean_Y_2 | time domain (50Hz capture) body acceleration y-axial - mean  
tBodyAcc_mean_Z_3 | time domain (50Hz capture) body acceleration z-axial - mean  
tGravityAcc_mean_X_41 | time domain (50Hz capture) gravity acceleration x-axial - mean  
tGravityAcc_mean_Y_42 | time domain (50Hz capture) gravity acceleration y-axial - mean  
tGravityAcc_mean_Z_43 | time domain (50Hz capture) gravity acceleration z-axial - mean  
tBodyAccJerk_mean_X_81 | body linear acceleration derived in time to obtain Jerk signals x-axial - mean  
tBodyAccJerk_mean_Y_82 | body linear acceleration derived in time to obtain Jerk signals y-axial - mean  
tBodyAccJerk_mean_Z_83 | body linear acceleration derived in time to obtain Jerk signals z-axial - mean  
tBodyGyro_mean_X_121 | body angular velocity derived in time to obtain Jerk signals x-axial - mean  
tBodyGyro_mean_Y_122 | body angular velocity derived in time to obtain Jerk signals y-axial - mean  
tBodyGyro_mean_Z_123 | body angular velocity derived in time to obtain Jerk signals z-axial - mean  
tBodyGyroJerk_mean_X_161 | body angular velocity derived in time to obtain Jerk signals x-axial - mean  
tBodyGyroJerk_mean_Y_162 | body angular velocity derived in time to obtain Jerk signals y-axial - mean  
tBodyGyroJerk_mean_Z_163 | body angular velocity derived in time to obtain Jerk signals z-axial - mean  
tBodyAccMag_mean_201 | as above fields but magnitude calculated using the Euclidean norm - mean  
tGravityAccMag_mean_214 | as above fields but magnitude calculated using the Euclidean norm - mean  
tBodyAccJerkMag_mean_227 | as above fields but magnitude calculated using the Euclidean norm - mean  
tBodyGyroMag_mean_240 | as above fields but magnitude calculated using the Euclidean norm - mean  
tBodyGyroJerkMag_mean_253 | as above fields but magnitude calculated using the Euclidean norm - mean  
fBodyAcc_mean_X_266 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyAcc_mean_Y_267 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyAcc_mean_Z_268 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyAcc_meanFreq_X_294 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyAcc_meanFreq_Y_295 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyAcc_meanFreq_Z_296 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyAccJerk_mean_X_345 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyAccJerk_mean_Y_346 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyAccJerk_mean_Z_347 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyAccJerk_meanFreq_X_373 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyAccJerk_meanFreq_Y_374 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyAccJerk_meanFreq_Z_375 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyGyro_mean_X_424 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyGyro_mean_Y_425 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyGyro_mean_Z_426 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyGyro_meanFreq_X_452 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyGyro_meanFreq_Y_453 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyGyro_meanFreq_Z_454 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyAccMag_mean_503 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyAccMag_meanFreq_513 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyBodyAccJerkMag_mean_516 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyBodyAccJerkMag_meanFreq_526 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyBodyGyroMag_mean_529 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyBodyGyroMag_meanFreq_539 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyBodyGyroJerkMag_mean_542 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
fBodyBodyGyroJerkMag_meanFreq_552 | as above fields but with Fast Fourier Transform (FFT) applied - f indicates frequency domain  - mean  
angletBodyAccMean_gravity_555 | angle between two vectors from above variables  
angletBodyAccJerkMean_gravityMean_556 | angle between two vectors from above variables  
angletBodyGyroMean_gravityMean_557 | angle between two vectors from above variables  
angletBodyGyroJerkMean_gravityMean_558 | angle between two vectors from above variables  
angleX_gravityMean_559 | angle between two vectors from above variables  
angleY_gravityMean_560 | angle between two vectors from above variables  
angleZ_gravityMean_561 | angle between two vectors from above variables  
tBodyAcc_std_X_4 | as above variables but standard deviation instead of mean  
tBodyAcc_std_Y_5 | as above variables but standard deviation instead of mean  
tBodyAcc_std_Z_6 | as above variables but standard deviation instead of mean  
tGravityAcc_std_X_44 | as above variables but standard deviation instead of mean  
tGravityAcc_std_Y_45 | as above variables but standard deviation instead of mean  
tGravityAcc_std_Z_46 | as above variables but standard deviation instead of mean  
tBodyAccJerk_std_X_84 | as above variables but standard deviation instead of mean  
tBodyAccJerk_std_Y_85 | as above variables but standard deviation instead of mean  
tBodyAccJerk_std_Z_86 | as above variables but standard deviation instead of mean  
tBodyGyro_std_X_124 | as above variables but standard deviation instead of mean  
tBodyGyro_std_Y_125 | as above variables but standard deviation instead of mean  
tBodyGyro_std_Z_126 | as above variables but standard deviation instead of mean  
tBodyGyroJerk_std_X_164 | as above variables but standard deviation instead of mean  
tBodyGyroJerk_std_Y_165 | as above variables but standard deviation instead of mean  
tBodyGyroJerk_std_Z_166 | as above variables but standard deviation instead of mean  
tBodyAccMag_std_202 | as above variables but standard deviation instead of mean  
tGravityAccMag_std_215 | as above variables but standard deviation instead of mean  
tBodyAccJerkMag_std_228 | as above variables but standard deviation instead of mean  
tBodyGyroMag_std_241 | as above variables but standard deviation instead of mean  
tBodyGyroJerkMag_std_254 | as above variables but standard deviation instead of mean  
fBodyAcc_std_X_269 | as above variables but standard deviation instead of mean  
fBodyAcc_std_Y_270 | as above variables but standard deviation instead of mean  
fBodyAcc_std_Z_271 | as above variables but standard deviation instead of mean  
fBodyAccJerk_std_X_348 | as above variables but standard deviation instead of mean  
fBodyAccJerk_std_Y_349 | as above variables but standard deviation instead of mean  
fBodyAccJerk_std_Z_350 | as above variables but standard deviation instead of mean  
fBodyGyro_std_X_427 | as above variables but standard deviation instead of mean  
fBodyGyro_std_Y_428 | as above variables but standard deviation instead of mean  
fBodyGyro_std_Z_429 | as above variables but standard deviation instead of mean  
fBodyAccMag_std_504 | as above variables but standard deviation instead of mean  
fBodyBodyAccJerkMag_std_517 | as above variables but standard deviation instead of mean  
fBodyBodyGyroMag_std_530 | as above variables but standard deviation instead of mean  
fBodyBodyGyroJerkMag_std_543 | as above variables but standard deviation instead of mean  


<end of variable list>  