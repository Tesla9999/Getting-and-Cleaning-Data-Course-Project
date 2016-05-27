# download the zip file to the working directory
# for windows OS, for Mac, you may need to add method = "curl" parameter
# if you have the zip file in your working directory, skip this part

file_url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file_url, destfile = "hw4data.zip", mode = "wb")

# unzip the downloaded file to the folder "UCI HAR Dataset"

unzip(zipfile="hw4data.zip")

# all the upziped files should be in "UCI HAR Dataset"
# read all the needed files to datasets

x_test<- read.table("UCI HAR Dataset/test/X_test.txt")
y_test<- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

features <- read.table("UCI HAR Dataset/features.txt")
act_label <- read.table("UCI HAR Dataset/activity_labels.txt")

# 1. Merges the training and the test sets to create one data set
## consolidate data by rows

test_val <- rbind(x_test, x_train) # 10299 (row) x 561 (col) 
test_label <- rbind(y_test, y_train) # 10299 (row) x 1 (col)
subject <- rbind(subject_test, subject_train) # 10299 (row) x 1 (col)

## assign names for each variable

names(subject) <- "subject"
names(test_val) <- features$V2
names(test_label) <- "activity"

## fianl merged dataset by column

merged_data <- cbind(subject, test_val, test_label) # 10299 (row) x 563 (col)

# 2. Extracts the measurements on mean and standard deviation 
## indexing if mean or std in the name

index<-grep("mean\\(\\)|std\\(\\)", features$V2)

## subset by column, use names(extracted) to check

extracted <- test_val[,index] # 10299 (row) x 563 (col)

# 3. Uses descriptive activity names to name the activities in the data set
## change the numeric "acitivity" column in merged data to factors

merged_data$activity <- as.factor(merged_data$activity)

## rename the numbered factors to char factors

levels(merged_data$activity) <- act_label$V2

# 4. Uses descriptive activity names to name the activities in the data set
## it has already beed done previously by names(test_val) <- features$V2
## before merging all the dataset (line #34), check using names(merged_data)

# 5. creates an independent tidy data set with the average of each variable 
## change the "subject" column to factor

merged_data$subject <- as.factor(merged_data$subject)

## calculate mean of all rows, grouped by the 2 factors, "subject" and "activity"
## row 2-562 are selected to exclude "subject" and "activity" (row 1 and 563)

tidydata <- aggregate(merged_data[, 2:562], by =list(subject = 
                      merged_data$subject, activity = merged_data$activity),
                      mean, na.rm =TRUE)
write.table(tidydata, "tidyData.txt", row.name=FALSE)
