
# Code Book


### Create one data set

1) Dowload zip files from the source using download.file function

2) Unzip file using unzip command

3) Read X files for training and test datasets

4) Read column names for X dataset from features.txt file

5) Add column names to X_train and X_test Dataframes

6) Combine X Data frames for train and test

7) Combine and add col name y_train and y_test rows

8) Combine and add col name subject_train and subject_test rows

9) Combine all columns into a sigle dataset


### Extracts mean and standard deviation
10) Get all column names in a vector

11) look for colnames conatining mean or std in their names and select those columns


### Name the activities in the data set
12) Load Activity Labels file

13) Factor Activity column and rename labels according to labels file

### Labels the data set with descriptive variable names.
14) Made folloiwng column name changes to labels the data set with descriptive variable names.


#### Change following Column Names:

Acc: accelerometer

Gyro: gyroscope

Mag: magnitude

t in the begining: time

f in the begining: Fast Fourier Transform

BodyBody: Body

mean(): mean_value

std(): standard_deviation

mad(): median_absolute_deviation

max(): maximum

min(): minimum

sma(): signal_magnitude_area

energy(): energy_measure

iqr(): interquartile_range

entropy(): signal_entropy

arCoeff(): autorregresion_coefficients

correlation(): correlation_coefficient

maxInds(): maximum_index

meanFreq(): mean_frequency

skewness(): skewness

kurtosis(): kurtosis

bandsEnergy(): energy_of_a_frequency_band

angle(): angle_between_two_vectors



### Create a second, independent tidy data set of means

15) Get colname excluding Activity and Subject

16) Group Activity and Subject and get mean for rest of the columns





### Feature Selection


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'





