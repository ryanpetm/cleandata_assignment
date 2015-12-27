
data_subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
data_X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
data_y_test <- read.table( "UCI HAR Dataset/test/y_test.txt")
data_subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
data_X_train <- read.table( "UCI HAR Dataset/train/X_train.txt")
data_y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
data_features <- read.table( "UCI HAR Dataset/features.txt")
data_activity <- read.table( "UCI HAR Dataset/activity_labels.txt")


# merge dataframes
subject <- rbind(data_subject_test, data_subject_train)
X <- rbind(data_X_test, data_X_train)
y<- rbind(data_y_test, data_y_train)

# label X,y,subject
names(X) <- data_features[,2]
names(y) <- c("activity")
names(subject) <- c("subject")

#subset X for mean and Std
X_new <- X[,grep("mean|std", colnames(X))]

#map activity number to activity descriptor
activity_descriptor <- mapvalues(y$activity,
    from = c(1,2,3,4,5,6),
    to = c("LAYING", "SITTING", "STANDING", "WALKING", 
           "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"))

# combine subject, activity and X_new to bulid new data frame appropriate for 
#result of first tidy data set

data_set_1 <- cbind(subject,data_frame(activity_descriptor),X_new)
rm(list=setdiff(ls(), "data_set_1"))


#group data_set_1 by subject
subject_data <- group_by(data_set_1, subject)

#average of each variable for each activity and each subject
data_set_2 <- aggregate(. ~ subject+activity_descriptor , data = subject_data, mean)

# write table as requested in assignment
write.table(data_set_2, "result.txt", row.name=FALSE ,sep = " ")

