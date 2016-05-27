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

The following files are needed to have a merged dataset:

"UCI HAR Dataset/test/X_test.txt"

"UCI HAR Dataset/test/y_test.txt"

"UCI HAR Dataset/test/subject_test.txt"

"UCI HAR Dataset/train/X_train.txt"

"UCI HAR Dataset/train/y_train.txt"

"UCI HAR Dataset/train/subject_train.txt"

"UCI HAR Dataset/features.txt"

"UCI HAR Dataset/activity_labels.txt"


##The code will merge all the data, assign corresponding labels to every variable and finally output the tidydata.txt for mean of each each variable for each activity and each subject.


##Code book for important variables in the run_analysis.R

x_test: dataset from ("UCI HAR Dataset/test/X_test.txt")

y_test: dataset from ("UCI HAR Dataset/test/y_test.txt")

subject_test: dataset from ("UCI HAR Dataset/test/subject_test.txt")

x_train: dataset from ("UCI HAR Dataset/train/X_train.txt")

y_traind: dataset from ("UCI HAR Dataset/train/y_train.txt")

subject_train: dataset from ("UCI HAR Dataset/train/subject_train.txt")

features: dataset from ("UCI HAR Dataset/features.txt")

act_label: dataset from ("UCI HAR Dataset/activity_labels.txt")


test_val: acutual measurements, temporary merged dataset from  x_test and x_train # 10299 (row) x 561 (col) 

test_label: activity labels (numeric) of the measurements, temporary merged dataset from) # 10299 (row) x 1 (col)

subject: subject ids, temporary merged dataset from subject_test, subject_train) # 10299 (row) x 1 (col)

merged_data: final merged dataset for part1, 3, and 4 **

\> str(merged_data)

'data.frame':	10299 obs. of  563 variables:

 $ subject                             : Factor w/ 30 levels "1","2","3","4",..: 2 2 2 2 2 2 2 2 2 2 ...

 $ tBodyAcc-mean()-X                   : num  0.257 0.286 0.275 0.27 0.275 ...

 $ tBodyAcc-mean()-Y                   : num  -0.0233 -0.0132 -0.0261 -0

... ...
 

\> names(merged_data)

 [1] "subject"                              "tBodyAcc-mean()-X"                   

 [3] "tBodyAcc-mean()-Y"                    "tBodyAcc-mean()-Z"                   

 [5] "tBodyAcc-std()-X"                     "tBodyAcc-std()-Y"                     

... ... (skipped) 

 [557] "angle(tBodyAccJerkMean),gravityMean)" "angle(tBodyGyroMean,gravityMean)"    

 [559] "angle(tBodyGyroJerkMean,gravityMean)" "angle(X,gravityMean)"                

 [561] "angle(Y,gravityMean)"                 "angle(Z,gravityMean)"                

 [563] "activity"                             

extracted: part 2 required dataset **

\> str(extracted)

 'data.frame':	10299 obs. of  66 variables:

 $ tBodyAcc-mean()-X          : num  0.257 0.286 0.275 0.27 0.275 ...

 $ tBodyAcc-mean()-Y          : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...

 $ tBodyAcc-mean()-Z          : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...

... ...

tidydata: part 5 requried dataset **

\> str(tidydata)

'data.frame':	180 obs. of  563 variables:

 $ subject                             : Factor w/ 30 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...

 $ activity                            : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 1 1 1 1 1 1 1 1 1 ...

 $ tBodyAcc-mean()-X                   : num  0.277 0.276 0.276 0.279 0.278 ...

 $ tBodyAcc-mean()-Y                   : num  -0.0174 -0.0186 -0.0172 -0.0148 -0.0173 ...

 $ tBodyAcc-mean()-Z                   : num  -0.111 -0.106 -0.113 -0.111 -0.108 ...

... ...


Thanks for reading!






