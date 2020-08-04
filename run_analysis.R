#The data files are already downloaded locally on my computer.

#Setting the directory to where the files are:-
setwd("D:/STUDIES/PROGRAMS R/")
#===========================================================================================================================
#1.Merging training and test sets to create on data set
#----------------------------------------------------------------------------------------------------------------------------
#Reading the training files
trainingSet <- read.table("./ProjectData/UCI HAR Dataset/train/X_train.txt") #Reading training set
trainingLabels <- read.table("./ProjectData/UCI HAR Dataset/train/y_train.txt") #Reading training labels
trainingSubjects <- read.table("./ProjectData/UCI HAR Dataset/train/subject_train.txt") #Reading subjects of training set

#Reading the test files
testSet <- read.table("./ProjectData/UCI HAR Dataset/test/X_test.txt") #Reading test set
testLabels <- read.table("./ProjectData/UCI HAR Dataset/test/y_test.txt") #Reading test labels
testSubjects <- read.table("./ProjectData/UCI HAR Dataset/test/subject_test.txt") #Reading subjects of test set

#Reading feature vector 
features <- read.table("./ProjectData/UCI HAR Dataset/features.txt")

#Formatting training set
colnames(trainingLabels) <- "Labels"
colnames(trainingSubjects) <- "Subjects"
colnames(trainingSet) <- features[, 2]
training <- cbind(trainingSet, trainingLabels, trainingSubjects)

#Formatting test set
colnames(testLabels) <- "Labels"
colnames(testSubjects) <- "Subjects"
colnames(testSet) <- features[, 2]
test <- cbind(testSet, testLabels, testSubjects)

#Merging training and test sets
merged <- rbind(training, test)
#============================================================================================================================

#Extract only the measurements of mean and standard deviation for each measurement
extracted <- merged[, grep("-mean()[^F]|-std()|Labels|Subjects", colnames(merged))]

#============================================================================================================================

#Use descriptive activity names to name the activities in the data set
#----------------------------------------------------------------------------------------------------------------------------
class(extracted[, "Labels"]) <- as.character(extracted[, "Labels"])

actLabels <- read.table("./ProjectData/UCI HAR Dataset/activity_labels.txt") #Reading activity_labels file

#Substituting descriptive numbers with descriptive names of activities in the data frame 
extracted[, "Labels"] <- sub(actLabels[,1][[1]], actLabels[,2][[1]], extracted[, "Labels"])
extracted[, "Labels"] <- sub(actLabels[,1][[2]], actLabels[,2][[2]], extracted[, "Labels"])
extracted[, "Labels"] <- sub(actLabels[,1][[3]], actLabels[,2][[3]], extracted[, "Labels"])
extracted[, "Labels"] <- sub(actLabels[,1][[4]], actLabels[,2][[4]], extracted[, "Labels"])
extracted[, "Labels"] <- sub(actLabels[,1][[5]], actLabels[,2][[5]], extracted[, "Labels"])
extracted[, "Labels"] <- sub(actLabels[,1][[6]], actLabels[,2][[6]], extracted[, "Labels"])

#============================================================================================================================
#Appropriately labeling data with descriptive variable names
#----------------------------------------------------------------------------------------------------------------------------

#Making the names of data variables more descriptive
colnames(extracted) <- gsub("-", " ", colnames(extracted))
colnames(extracted) <- gsub("[()]", "", colnames(extracted))
colnames(extracted) <- gsub("X", "X-Axis", colnames(extracted))
colnames(extracted) <- gsub("Y", "Y-Axis ", colnames(extracted))
colnames(extracted) <- gsub("Z", "Z-Axis ", colnames(extracted))
colnames(extracted) <- gsub("^t", "TimeDomain ", colnames(extracted))
colnames(extracted) <- gsub("^f", "FrequencyDomain ", colnames(extracted))
colnames(extracted) <- gsub("BodyBody", "Body", colnames(extracted))

#============================================================================================================================
#Creating second tidy data set with average of each variable for each activity and each subject
#----------------------------------------------------------------------------------------------------------------------------
tidyData <- aggregate(extracted, by = list(extracted$Labels, extracted$Subjects), FUN = mean)

#loading dplyr package
library(dplyr)

tidyData <- select(tidyData, -(Labels:Subjects))
names(tidyData)[[1]] <- "Activity"
names(tidyData)[[2]] <- "Subjects"
#Writing tidy data into a text file
write.table(extracted, file = "Tidy Data.txt", quote = FALSE, row.names = FALSE)
#=============================================================================================================================
