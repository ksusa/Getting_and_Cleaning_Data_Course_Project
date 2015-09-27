####downloade file
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" , 
              destfile = "UCI_HAR_Dataset", method = "curl")
####unzip file
UCI_HAR_Dataset<-unzip("UCI_HAR_Dataset")

# read of files (datasets) what  used afterwards for merge
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
s_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_training <- read.table("UCI HAR Dataset/train/X_train.txt")
y_training <- read.table("UCI HAR Dataset/train/y_train.txt")
s_training <- read.table("UCI HAR Dataset/train/subject_train.txt")
###load activity label
l_activity <- read.table("UCI HAR Dataset/activity_labels.txt")
###load feature
f_features <- read.table("UCI HAR Dataset/features.txt")
########view of datasets for analysis
View (x_test)
View (y_test)
View (s_test)
View(x_training)
View(y_training)
View(s_training)
View(l_activity)
View(f_features)
# clean up for features, for example: tBodyAcc-sma() ---> tBodyAcc-sma
f_features <- gsub("\\()", "", f_features$V2)
# clean up fpr level activity  , foe  example V1, V2:WALKING_UPSTAIRS... ---> x:walking upstairs
l_activity <- l_activity$V2
l_activity <- tolower(l_activity)
l_activity <- sub("_", " ", l_activity)
# relabel the names of columns for example "V1", "V2"....--->"tBodyAcc-mean-X", ...
names(x_test) <- f_features
names(x_training) <- f_features
#rename of  columns for  example "V1"----> "activity"
names(y_test) <- "activity"
names(y_training) <- "activity"
names(s_test) <- "participant"
names(s_training) <- "participant"

#### merges the training and the test .  Binding the training and test  formed of output dataframe
test_train_merge <- rbind(x_test, x_training)
View (test_train_merge)### big data :)
# Extrating columns containing  mean or standard deviation
slice <- grep("mean|std", names(test_train_merge))
View(slice)
# New _datawill hold initial identifiers
training <- data.frame(y_training, s_training)
test <- data.frame(y_test, s_test)
test_train_Merge<- rbind(test, training)
# add the slice column to test_train_merge  created in the previous step
for(i in slice) {
  test_train_Merge <- cbind(test_train_Merge, test_train_merge[i])
}
# replace the activity enumerations with the labels as in activityY
test_train_Merge$activity <- mapvalues(test_train_Merge$activity, 
                                from = levels(factor(test_train_Merge$activity)), to = l_activity)

######create independent tidy data set with the average of each variable for each activity and each subject. 
Tidy <- aggregate(test_train_Merge, list(test_train_Merge$participant, test_train_Merge$activity), mean)
Tidy$participant <- NULL;
Tidy$activity <- NULL
names(Tidy)[1] <- "participant"; 
names(Tidy)[2] <- "activity"
# writing Tidy into a file "Tidy.txt"
write.table(file = "Tidy.txt", x = Tidy, row.names = FALSE)
tt<-read.csv("Tidy.txt")
tt

