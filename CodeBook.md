# Code Book for Getting and Cleaning Data Course Project  
This file describes the variables, the data, and any transformations or work that is performed to clean up the data.  

The variables used in the code of run_analysis file are:-
- **testSet :** This data frame contains all the observations of the test set.
- **testLabels :** This data frame contains all the labels (each label number corresponds to an activity) for every observation of test data.
- **testSubjects :** This data frame contains all the subjects that correspond to each observation of the test set. There are a total of 30 subjects.
- **trainingSet :** This data frame contains all the observations of the training set.
- **trainingLabels :** This data frame contains all the labels (each label number corresponds to an activity) for every observation of training data.
- **trainingSubjects :** This data frame contains all the subjects that correspond to each observation of the training set. There are a total of 30 subjects.
- **features :** This data frame contains all the different variables for which each observation was taken (they are the column names).
- **actLabels :** The first column of this data frame contains the numbers that are mentioned in the labels column and the second column of this data frame contains the activity that corresponds to each label.  

### Transformation 1

The second column of *features* data set contains all the names of features/variables and is hence merged with training and test data to make it the column names of the data.  

- **test :** This data frame contains the test dataset with 561 defined column names from the feature vector and two added columns that define the labels(named as Labels) and subjects(named as Subjects) for each variable.
- **training :** This data frame contains the test dataset with 561 defined column names from the feature vector and two added columns that define the labels(named as Labels) and subjects(named as Subjects) for each variable.

### Transformation 2 

- **merged :** The training (DF dimensions: 7532x563) and test (DF dimensions: 2947x563) sets are then merged together using the ```rbind()``` function and stored in this variable.

### Transformation 3  

- **extracted :** This data frame contains only the columns that measure the mean or standard deviation (for X, Y and Z axes) along with the Labels and Subjects column.  

### Transformation 4
The class of the *Labels* column of *extracted* data set was changed from numeric to character so that proper activity names can be substituted in place of the number as given in the *actLabels* data frame. This substitution was done with ```sub()``` function. **Working :** All the observations that were labelled 1 in the *Labels* column of *extracted* dataset were matched with the first observation of first column of *actLabels* dataset (because first column contains the numbers and first observation is 1), and are then replaced with the corresponding activity name that is provided in the second column of *actLabels* dataset. This is done for all 1 to 6 activities.  

### Transformation 5
After this, the column names for the *extracted* data set were made more descriptive by removing parenthesis and hyphens and replacing abbreviations with actual words. t denotes time domain and f denotes frequency domain so they were changed accordingly. For instance, "tBodyGyro-mean()-X" was changed to "Time Domain BodyGyro mean X-axis", "fBodyBodyAccJerkMag-std()" was changed to "FrequencyDomain BodyAccJerkMag std" and so on.  

### Transformation 6
Lastly, a tidy data set was created by using dplyr package as explained in README.md file and was written into a textual format by using ```write.table()``` function.