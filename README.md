# Course-3-Project
Project of Course 3 of Data Science Specialization (Getting and Cleaning Data)  

Wearable computing is a new interest in data science field in which computers and sensors are fitted on the wearable devices like phones, watches, spectacles and even clothes. Many companies are racing to develop the most advanced algorithms to attract new users The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

This is the file that explains how my scripts work and how they are connected.  

**run_analysis.R** file contains the code that does the following:-  
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each   activity and each subject.  


The data for this project was already downloaded from the links provided and saved locally on my computer. It also contained the files that explain the data. The traiing and test sets were provided and their subjects and labels were provided in different files. The features/variable names were also provided in a different file. So the training and test data were compiled first, by adding the columns for labels and subjects and giving all the column names that were provided in features file. Then both these data were merged together.  

Then a dataset was extracted in which only the measurements of mean and standard deviation for each measurement were present.  

Then all the labels, which were originally in numeric form where each number represented a particular activity, were substituted with their actual descriptive names.  

After that, all the column names which were in the form of abbreviations and symbols were changed into descriptive variable names.  

Finally, a tidy dataset was created that contains the average of each variable for each activity and each subject. That is, for instance, all the variables for all the times the first activity was performed by subject 1 were averaged and written in the tidy data set. Similar calculation was done for other activities by subject 1 and 2 and so on. This tidy data set was written in a textual format.  