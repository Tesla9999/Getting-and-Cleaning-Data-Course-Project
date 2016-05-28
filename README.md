# Getting-and-Cleaning-Data-Course-Project

#Assignment for Getting and Cleaning Data

##The project has 5 parts: 

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of 
   each variable for each activity and each subject.


##For the run_analysis.R

It downloads the zip file from the url to the current working folder, then unzip to the default folders.

The following files are actually needed to form the merged dataset:

"UCI HAR Dataset/test/X_test.txt"

"UCI HAR Dataset/test/y_test.txt"

"UCI HAR Dataset/test/subject_test.txt"

"UCI HAR Dataset/train/X_train.txt"

"UCI HAR Dataset/train/y_train.txt"

"UCI HAR Dataset/train/subject_train.txt"

"UCI HAR Dataset/features.txt"

"UCI HAR Dataset/activity_labels.txt"


##The code will do:

1. merge all the measurement data to one dataset "merged_data"

2. extract the dataset only for the mean and standard deviation to "extract"
 
3. assign descriptive labels to every variable and add 2 column - "subject" and "activity" to the extracted dataset

4. rename the "activity" column from numbers to descriptive names, the fianl extracted data is stored in "extracted_data"

5. output the "tidydata" to "tidydata.txt" for mean of each each variable for each activity and each subject based on "extracted_data" 


##Examples for the 3 most important datasets "merged_data", "extracted_data" and "tidydata":

\> str(merged_data)

data.frame':	10299 obs. of  561 variables:

 $ V1  : num  0.257 0.286 0.275 0.27 0.275 ...
 
 $ V2  : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
 
 $ V3  : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...
 
 $ V4  : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...
 
 $ V5  : num  -0.92 -0.967 -0.97 -0.973 -0.967 ...
 
 $ V6  : num  -0.668 -0.945 -0.963 -0.967 -0.978 ...

... ...
 

\> str(extracted_data)

'data.frame':	10299 obs. of  81 variables:

 $ subject                        : Factor w/ 30 levels "1","2","3","4",..: 2 2 2 2 2 2 2 2 2 2 ...

 $ activity                       : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 5 5 5 5 5 5 5 5 5 5 ...

 $ tBodyAcc-mean()-X              : num  0.257 0.286 0.275 0.27 0.275 ...

 $ tBodyAcc-mean()-Y              : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...

 $ tBodyAcc-mean()-Z              : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...

 $ tBodyAcc-std()-X               : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...

... ...
 
\> str(tidydata)

''data.frame':	180 obs. of  81 variables:

 $ subject                        : Factor w/ 30 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
 
 $ activity                       : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 1 1 1 1 1 1 1 1 1 ...
 
 $ tBodyAcc-mean()-X              : num  0.277 0.276 0.276 0.279 0.278 ...
 
 $ tBodyAcc-mean()-Y              : num  -0.0174 -0.0186 -0.0172 -0.0148 -0.0173 ...
 
 $ tBodyAcc-mean()-Z              : num  -0.111 -0.106 -0.113 -0.111 -0.108 ...
 
 $ tBodyAcc-std()-X               : num  -0.284 -0.424 -0.36 -0.441 -0.294 ...

... ...

Thanks for reading!






