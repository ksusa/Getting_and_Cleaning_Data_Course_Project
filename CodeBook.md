Origin

The data originates from study: Jorge L. et al. "Human Activity Recognition Using Smartphones Dataset". 
The description of the paper is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
The raw data is in a zip file available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data

The data was obtained from carrying out experiments with 30 participants performing six different activities while wearing a smartphone. The data was randomly split into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. Using the phone's embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

Files

- subject_test.txt - the participant number for the test, 1-30
- y_test.txt - the activity number for the test, 1-6
- X_test.txt - the vector information for the test, 1-531
- subject_training.txt - the participant number for the training,1-30
- y_training.txt - the activity number for the training, 1-6
- X_training.txt - the vector information for the training, 1-531
- features.txt - the descriptive names of activities README.txt.

Transformations

- Data was load into R.
- Levels were load into R.
- The identifier column names were given clearer labels, "activity" and "participant".
- Column names were renamed as indicated in features.txt.
- Unneccessary brackets and underscored were removed.
- A data frame displayed only mean and standard deviation data was created.
- The test and training sets were merged together into a single data frame.
- The data frame was filtered by searching the column names corrsespond to "std" and "mean".
- The filtered columns were combined with the identifier columns.
 -The numeric labels for activities were converted to descriptive ones.
- The numeric labels changed. The following labels were produced: walking, walking upstairs, walking downstairs, sitting, standing, laying.
- Independent tidy data frame was created using the aggregate function with the average of each variable for each activity and each subject.
- Then was written to a "Tidy.txt".


Identifiers

participant - the participant number 
activity - the activity description
The vector information contains 81 rows that are comprised of many elements for a given measurement. 

Tidy's parameters

t prefix - measurement in the time domain
f prefix- measurement in the frequency domain
Jerk - jerk 
Gyro - angular velocity
Body - own movement of a person
Gravity - movement due to gravity
Mag - magnitude using the Euclidean norm
Acc - acceleration 
std - standard deviation
mean - average
