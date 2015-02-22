The variable names for each of the 68 columns of the tidy_dta.txt file are listed below.


1. "SubjectID"

    An integer from 1 to 30 that identifies the subject, using both tte test and train data sets.

2. "Activity"

    A character string that identifies the activity performed by the SubjectID.  
    There are 6 activities in the data set: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"


3-68. See list below.

The remaining 66 variables (columns 3-68) are named according to the conventions found in the features.txt and features_info.txt files.  All variables are dimensionless, as they have been normalized.

The tidy data set found in "tidy_data.txt" lists only observations of the mean and standard deviation of these quantities.  These variables are indicated with the string "mean" and "std" respectively".

It is important to note that the values given in columns 3-68 in the tidy_data.txt file are the average of each variable for each SubjectID and Activity.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

't' denotes time domain signals captured at a constant rate of 50 Hz.
'f' denotes frequency domain signals 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


3-14.  The acceleration signal was separated into body and gravity acceleration signals (tBodyAcc-XYZ, tGravityAcc-XYZ). 

21-26. The gyroscope signals (tBodyGyro-XYZ).

15-20 & 27-32.  The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).  

33-42.  The magnitude of the three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

43-68.  A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 


*** List of accelerometer and gyroscope mean and standard deviation variables:

3. "tBodyAcc-mean-X"
4. "tBodyAcc-mean-Y"
5. "tBodyAcc-mean-Z"
6. "tBodyAcc-std-X"
7. "tBodyAcc-std-Y"
8. "tBodyAcc-std-Z"
9. "tGravityAcc-mean-X"
10. "tGravityAcc-mean-Y"
11. "tGravityAcc-mean-Z"
12. "tGravityAcc-std-X"
13. "tGravityAcc-std-Y"
14. "tGravityAcc-std-Z"
15. "tBodyAccJerk-mean-X"
16. "tBodyAccJerk-mean-Y"
17. "tBodyAccJerk-mean-Z"
18. "tBodyAccJerk-std-X"
19. "tBodyAccJerk-std-Y"
20. "tBodyAccJerk-std-Z"
21. "tBodyGyro-mean-X"
22. "tBodyGyro-mean-Y"
23. "tBodyGyro-mean-Z"
24. "tBodyGyro-std-X"
25. "tBodyGyro-std-Y"
26. "tBodyGyro-std-Z"
27. "tBodyGyroJerk-mean-X"
28. "tBodyGyroJerk-mean-Y"
29. "tBodyGyroJerk-mean-Z"
30. "tBodyGyroJerk-std-X"
31. "tBodyGyroJerk-std-Y"
32. "tBodyGyroJerk-std-Z"
33. "tBodyAccMag-mean"
34. "tBodyAccMag-std"
35. "tGravityAccMag-mean"
36. "tGravityAccMag-std"
37. "tBodyAccJerkMag-mean"
38. "tBodyAccJerkMag-std"
39. "tBodyGyroMag-mean"
40. "tBodyGyroMag-std"
41. "tBodyGyroJerkMag-mean"
42. "tBodyGyroJerkMag-std"
43. "fBodyAcc-mean-X"
44. "fBodyAcc-mean-Y"
45. "fBodyAcc-mean-Z"
46. "fBodyAcc-std-X"
47. "fBodyAcc-std-Y"
48. "fBodyAcc-std-Z"
49. "fBodyAccJerk-mean-X"
50. "fBodyAccJerk-mean-Y"
51. "fBodyAccJerk-mean-Z"
52. "fBodyAccJerk-std-X"
53. "fBodyAccJerk-std-Y"
54. "fBodyAccJerk-std-Z"
55. "fBodyGyro-mean-X"
56. "fBodyGyro-mean-Y"
57. "fBodyGyro-mean-Z"
58. "fBodyGyro-std-X"
59. "fBodyGyro-std-Y"
60. "fBodyGyro-std-Z"
61. "fBodyAccMag-mean"
62. "fBodyAccMag-std"
63. "fBodyBodyAccJerkMag-mean"
64. "fBodyBodyAccJerkMag-std"
65. "fBodyBodyGyroMag-mean"
66. "fBodyBodyGyroMag-std"
67. "fBodyBodyGyroJerkMag-mean"
68. "fBodyBodyGyroJerkMag-std"