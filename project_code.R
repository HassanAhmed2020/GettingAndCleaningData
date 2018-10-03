
getwd()
library(tidyverse)
library(dplyr)

# 1) Dowload zip files from the source using download.file function


#===================================================================================================================
#==============================Question 1===========================================================================
#===================================================================================================================

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url, destfile = "Dataset.zip", mode = "wb")
rm(url)
# 2) Unzip file using unzip command

#unzip("Dataset.zip", "Dataset")

# 3) Read X files for training and test datasets

X_train <- read_table("./UCI HAR Dataset/train/X_train.txt", col_names = FALSE)
X_test <- read_table("./UCI HAR Dataset/test/X_test.txt", col_names = FALSE)


# 4) Read column names for X dataset from features.txt file
X_colnames <- read_table("./UCI HAR Dataset/features.txt", col_names = FALSE)

# 5) Add column names to X_train and X_test Dataframes
colnames(X_train) <- X_colnames$X1
colnames(X_test) <- X_colnames$X1

# 6) Combine X Data frames for train and test
X_combine <- bind_rows(X_train, X_test)
rm(X_train)
rm(X_test)
rm(X_colnames)

#7 Combine and add col name y_train and y_test rows
Y_train <- read_table("./UCI HAR Dataset/train/y_train.txt", col_names = FALSE)
Y_test <- read_table("./UCI HAR Dataset/test/y_test.txt", col_names = FALSE)
Y_combine <- bind_rows(Y_train,Y_test)
colnames(Y_combine) <- c("Activity")
rm(Y_train)
rm(Y_test)


#8 Combine and add col name subject_train and subject_test rows
Subject_train <- read_table("./UCI HAR Dataset/train/subject_train.txt", col_names = FALSE)
Subject_test <- read_table("./UCI HAR Dataset/test/subject_test.txt", col_names = FALSE)
Subject_combine <- bind_rows(Subject_train,Subject_test)
colnames(Subject_combine) <- c("Subject")
rm(Subject_train)
rm(Subject_test)


#9 Combine all columns into a sigle dataset

Combine_df <- bind_cols(X_combine,Subject_combine,Y_combine)
rm(X_combine,Subject_combine,Y_combine)

#===================================================================================================================
#==============================Question2============================================================================
#===================================================================================================================


# 10) Get all column names in a vector

combine_df_colnames <- colnames(Combine_df)

# 11 look for colnames conatining mean or std in their names and select those columns
mean_std_cols_index <- grep("mean|std", combine_df_colnames)

mean_std_cols <- Combine_df %>% select(mean_std_cols_index)

rm(mean_std_cols_index, combine_df_colnames)




#===================================================================================================================
#==============================Question 3===========================================================================
#Uses descriptive activity names to name the activities in the data set
#===================================================================================================================

# 12) Load Activity Labels file

activity_labels <- read_table("./UCI HAR Dataset/activity_labels.txt", col_names = FALSE)


# 13) Factor Activity column and rename labels according to labels file

Combine_df$Activity <- as.factor(Combine_df$Activity)
levels(Combine_df$Activity)[c(1,2,3,4,5,6)] <- activity_labels$X2
rm(activity_labels)




#===================================================================================================================
#==============================Question 4===========================================================================
#Appropriately labels the data set with descriptive variable names.
#===================================================================================================================

# 14) Made folloiwng column name changes to labels the data set with descriptive variable names.


combine_df_colnames <-  colnames(Combine_df)


#Acc -- accelerometer 
combine_df_colnames1 <- gsub("Acc", " accelerometer ", combine_df_colnames)

#Gyro -- gyroscope 
combine_df_colnames1 <- gsub("Gyro", " gyroscope ", combine_df_colnames1)

#Mag -- magnitude  
combine_df_colnames1 <- gsub("Mag", " magnitude ", combine_df_colnames1)

#t in the begining -- time
combine_df_colnames1 <- gsub("(^\\d+) t", "\\1 time ", combine_df_colnames1)

#f in the begining -- Fast Fourier Transform
combine_df_colnames1 <- gsub("(^\\d+) f", "\\1 fast_fourier_transform ", combine_df_colnames1)

# BodyBody: Body
combine_df_colnames1 <- gsub("BodyBody", " Body ", combine_df_colnames1)

#mean(): Mean value
combine_df_colnames1 <- gsub("-mean\\(\\)", " mean_value ", combine_df_colnames1)

# std(): standard_deviation
combine_df_colnames1 <- gsub("-std\\(\\)", " standard_deviation ", combine_df_colnames1)

# mad(): median_absolute_deviation 
combine_df_colnames1 <- gsub("-mad\\(\\)", " median_absolute_deviation ", combine_df_colnames1)

# max(): maximum
combine_df_colnames1 <- gsub("-max\\(\\)", " maximum ", combine_df_colnames1)

# min(): minimum
combine_df_colnames1 <- gsub("-min\\(\\)", " minimum ", combine_df_colnames1)

# sma(): signal_magnitude_area
combine_df_colnames1 <- gsub("-sma\\(\\)", " signal_magnitude_area ", combine_df_colnames1)

# energy(): energy_measure
combine_df_colnames1 <- gsub("-energy\\(\\)", " energy_measure ", combine_df_colnames1)

# iqr(): interquartile_range
combine_df_colnames1 <- gsub("-iqr\\(\\)", " interquartile_range ", combine_df_colnames1)

# entropy(): signal_entropy
combine_df_colnames1 <- gsub("-entropy\\(\\)", " signal_entropy ", combine_df_colnames1)

# arCoeff(): autorregresion_coefficients
combine_df_colnames1 <- gsub("-arCoeff\\(\\)", " autorregresion_coefficients ", combine_df_colnames1)

# correlation(): correlation_coefficient
combine_df_colnames1 <- gsub("-correlation\\(\\)", " correlation_coefficient ", combine_df_colnames1)

# maxInds(): maximum_index
combine_df_colnames1 <- gsub("-maxInds", " maximum_index ", combine_df_colnames1)

# meanFreq(): mean_frequency
combine_df_colnames1 <- gsub("-meanFreq\\(\\)", " mean_frequency ", combine_df_colnames1)

# skewness(): skewness
combine_df_colnames1 <- gsub("-skewness\\(\\)", " skewness ", combine_df_colnames1)

# kurtosis(): kurtosis
combine_df_colnames1 <- gsub("-kurtosis\\(\\)", " kurtosis ", combine_df_colnames1)

# bandsEnergy(): energy_of_a_frequency_band
combine_df_colnames1 <- gsub("-bandsEnergy\\(\\)", " bandsEnergy ", combine_df_colnames1)

# angle(): angle_between_two_vectors
combine_df_colnames1 <- gsub("angle", " angle_between_two_vectors", combine_df_colnames1)

# Remove extra spaces in column names
combine_df_colnames1 <- gsub("  ", " ", combine_df_colnames1)


colnames(Combine_df) <- combine_df_colnames1

# combine_df_colnames1[grep("minimum", combine_df_colnames1)]
# head(combine_df_colnames1)


#===================================================================================================================
#==============================Question 5===========================================================================
#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#===================================================================================================================

# 14) Get colname excluding Activity and Subject


combine_df_colnames <- colnames(Combine_df[1:561])


# 15) Group Activity and Subject and get mean for rest of the columns

AverageVariables <- Combine_df %>%
        group_by(Subject, Activity) %>%
        summarise_at(combine_df_colnames, mean, na.rm = TRUE)

write_csv(AverageVariables, "./AverageVariables.csv")
