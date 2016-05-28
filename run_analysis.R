# download the zip file to the working directory
# was run for windows OS
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
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt")

# 1. Merges the training and the test sets to create one data set

merged_data <- rbind(x_test, x_train) # 10299 (row) x 561 (col) 

# 2. Extracts the measurements on mean and standard deviation 

## indexing if mean or std in the name

index <- grep("mean()|std()", features$V2)

## extract the dataset on mean and standard deviation

extract <- merged_data[,index] # 10299 (row) x 79 (col)

# 3. Uses descriptive activity names to name the activities in the dataset
# 4. Appropriately labels the data set with descriptive variable names

## combine the subjects and acitivity data

activity <- rbind(y_test, y_train) # 10299 (row) x 1 (col)
subject <- rbind(subject_test, subject_train) # 10299 (row) x 1 (col)

## give descriptive names to each dataset

names(subject) <- "subject"
names(activity) <- "activity"
names(extract) <- features$V2[index] # only names for mean and std

## fianl extracted dataset with descriptive names for every column
## subject and activity are added as the 1st two columns to the dataset

extracted_data <- cbind(subject, activity, extract) # 10299 (row) x 81 (col)

## rename activity using descriptive activity names in the dataset

activity_names <- factor(extracted_data$activity)
levels(activity_names) <- activity_label$V2
extracted_data$activity <- activity_names

# 5. creates an independent tidy data set with the average of each variable 

## convert subject column to factor

extracted_data$subject <- as.factor(extracted_data$subject)

## calculate mean of all rows, grouped by the 2 factors, "subject" and "activity"
## "subject" and "activity" (row 1 and 2) are excluded from summerizing

tidydata <- aggregate(extracted_data[, -c(1:2)], by =list(subject = 
                      extracted_data$subject, activity = extracted_data$activity),
                      mean, na.rm =TRUE)
write.table(tidydata, "tidydata.txt", row.name=FALSE)
