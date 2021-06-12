---
title: Codebook for "run_analysis.R"
output: html_document
---

## Analysis

run_analysis.R does the following: 

### 1. Merges the training and the test sets to create one data set.

1.1. Download the zipped file folder and identify the files containing test and train data that needs to be combined/merged. Please refer to README.md for the location of the original zipped file. 

1.2. For both the test data and train data, 3 files containing different variants --i.e., subject, activity and features need to be combined by the columns. 

1.3. Once you have the combined test data and train data, combine them into one table by the rows and assign appropriate labels. There are 10299 rows in total. 

### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

2.1. Subset the full data to include only the variants referring to the means and stds. There are 86 of them out of the 561 features in total. 

### 3. Uses descriptive activity names to name the activities in the data set. 

3.1. Activities are in numbers in the data frame created above. By referring to "activity_labels.txt", this can be changes to more descriptive data into the data frame. 

### 4. Appropriately labels the data set with descriptive variable names. 

4.1. Without the product expertise, it is hard to decide how descriptive the labels need to be but the file in the data set titled "features_info.txt" explains what the variables are. 

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

5.1. For this part of the code, use dplyr package. Install and load. 
5.2. Group by "subject" and "activity" and summarize the mean. 
5.3. Export the final data. 


## Variables in the final data frame

- [1] Subject: 30 volunteers within an age bracket of 19-48 years
- [2] Activity: activity
  - 1 WALKING
  - 2 WALKING_UPSTAIRS
  - 3 WALKING_DOWNSTAIRS
  - 4 SITTING
  - 5 STANDING
  - 6 LAYING
- features: 
  - [3] "TimeBodyAccelerometer-mean()-X"                        
[4] "TimeBodyAccelerometer-mean()-Y"                        
[5] "TimeBodyAccelerometer-mean()-Z"                        
[6] "TimeBodyAccelerometer-std()-X"                         
[7] "TimeBodyAccelerometer-std()-Y"                         
[8] "TimeBodyAccelerometer-std()-Z"                         
[9] "TimeGravityAccelerometer-mean()-X"                     
[10] "TimeGravityAccelerometer-mean()-Y"                     
[11] "TimeGravityAccelerometer-mean()-Z"                     
[12] "TimeGravityAccelerometer-std()-X"                      
[13] "TimeGravityAccelerometer-std()-Y"                      
[14] "TimeGravityAccelerometer-std()-Z"                      
[15] "TimeBodyAccelerometerJerk-mean()-X"                    
[16] "TimeBodyAccelerometerJerk-mean()-Y"                    
[17] "TimeBodyAccelerometerJerk-mean()-Z"                    
[18] "TimeBodyAccelerometerJerk-std()-X"                     
[19] "TimeBodyAccelerometerJerk-std()-Y"                     
[20] "TimeBodyAccelerometerJerk-std()-Z"                     
[21] "TimeBodyGyroscope-mean()-X"                            
[22] "TimeBodyGyroscope-mean()-Y"                            
[23] "TimeBodyGyroscope-mean()-Z"                            
[24] "TimeBodyGyroscope-std()-X"                             
[25] "TimeBodyGyroscope-std()-Y"                             
[26] "TimeBodyGyroscope-std()-Z"                             
[27] "TimeBodyGyroscopeJerk-mean()-X"                        
[28] "TimeBodyGyroscopeJerk-mean()-Y"                        
[29] "TimeBodyGyroscopeJerk-mean()-Z"                        
[30] "TimeBodyGyroscopeJerk-std()-X"                         
[31] "TimeBodyGyroscopeJerk-std()-Y"                         
[32] "TimeBodyGyroscopeJerk-std()-Z"                         
[33] "TimeBodyAccelerometerMagnitude-mean()"                 
[34] "TimeBodyAccelerometerMagnitude-std()"                  
[35] "TimeGravityAccelerometerMagnitude-mean()"              
[36] "TimeGravityAccelerometerMagnitude-std()"               
[37] "TimeBodyAccelerometerJerkMagnitude-mean()"             
[38] "TimeBodyAccelerometerJerkMagnitude-std()"              
[39] "TimeBodyGyroscopeMagnitude-mean()"                     
[40] "TimeBodyGyroscopeMagnitude-std()"                      
[41] "TimeBodyGyroscopeJerkMagnitude-mean()"                 
[42] "TimeBodyGyroscopeJerkMagnitude-std()"                  
[43] "FrequencyBodyAccelerometer-mean()-X"                   
[44] "FrequencyBodyAccelerometer-mean()-Y"                   
[45] "FrequencyBodyAccelerometer-mean()-Z"                   
[46] "FrequencyBodyAccelerometer-std()-X"                    
[47] "FrequencyBodyAccelerometer-std()-Y"                    
[48] "FrequencyBodyAccelerometer-std()-Z"                    
[49] "FrequencyBodyAccelerometer-meanFreq()-X"               
[50] "FrequencyBodyAccelerometer-meanFreq()-Y"               
[51] "FrequencyBodyAccelerometer-meanFreq()-Z"               
[52] "FrequencyBodyAccelerometerJerk-mean()-X"               
[53] "FrequencyBodyAccelerometerJerk-mean()-Y"               
[54] "FrequencyBodyAccelerometerJerk-mean()-Z"               
[55] "FrequencyBodyAccelerometerJerk-std()-X"                
[56] "FrequencyBodyAccelerometerJerk-std()-Y"                
[57] "FrequencyBodyAccelerometerJerk-std()-Z"                
[58] "FrequencyBodyAccelerometerJerk-meanFreq()-X"           
[59] "FrequencyBodyAccelerometerJerk-meanFreq()-Y"           
[60] "FrequencyBodyAccelerometerJerk-meanFreq()-Z"           
[61] "FrequencyBodyGyroscope-mean()-X"                       
[62] "FrequencyBodyGyroscope-mean()-Y"                       
[63] "FrequencyBodyGyroscope-mean()-Z"                       
[64] "FrequencyBodyGyroscope-std()-X"                        
[65] "FrequencyBodyGyroscope-std()-Y"                        
[66] "FrequencyBodyGyroscope-std()-Z"                        
[67] "FrequencyBodyGyroscope-meanFreq()-X"                   
[68] "FrequencyBodyGyroscope-meanFreq()-Y"                   
[69] "FrequencyBodyGyroscope-meanFreq()-Z"                   
[70] "FrequencyBodyAccelerometerMagnitude-mean()"            
[71] "FrequencyBodyAccelerometerMagnitude-std()"             
[72] "FrequencyBodyAccelerometerMagnitude-meanFreq()"        
[73] "FrequencyBodyBodyAccelerometerJerkMagnitude-mean()"    
[74] "FrequencyBodyBodyAccelerometerJerkMagnitude-std()"     
[75] "FrequencyBodyBodyAccelerometerJerkMagnitude-meanFreq()"
[76] "FrequencyBodyBodyGyroscopeMagnitude-mean()"            
[77] "FrequencyBodyBodyGyroscopeMagnitude-std()"             
[78] "FrequencyBodyBodyGyroscopeMagnitude-meanFreq()"        
[79] "FrequencyBodyBodyGyroscopeJerkMagnitude-mean()"        
[80] "FrequencyBodyBodyGyroscopeJerkMagnitude-std()"         
[81] "FrequencyBodyBodyGyroscopeJerkMagnitude-meanFreq()"    
[82] "angle(TimeBodyAccelerometerMean,gravity)"              
[83] "angle(TimeBodyAccelerometerJerkMean),gravityMean)"     
[84] "angle(TimeBodyGyroscopeMean,gravityMean)"              
[85] "angle(TimeBodyGyroscopeJerkMean,gravityMean)"          
[86] "angle(X,gravityMean)"                                  
[87] "angle(Y,gravityMean)"                                  
[88] "angle(Z,gravityMean)" 



--
*End of the document. *
