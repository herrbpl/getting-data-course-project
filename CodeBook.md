# Codebook

This is codebook for cleaned data from raw dataset available from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Codebook for raw data

Code book for raw data is available from raw data set files:

1. README.txt
2. features_info.txt
3. features.txt

Raw data is normalized, so it has no units and thus, derived data also has no 
units.

## Data transformations from raw data

Following operations were done with source data to aquire tidy dataset:

1. Joining datasets in train and test directory
2. joining together X_train.txt containing measured variables, y_train 
     containing activity codes and subject_train.txt containing subject 
     performing activity to train.data
3. joining together X_test.txt, y_test.txt, subject_test.txt to test.data
4. joining together test and train datasets
5. Subsetting only variables which ended with either "-std" or "-mean"
6. Replacing activity code in subsetted data set to activity labels from 
     activity_labels.txt
7. Replacing variable names with ones conforming R naming best practice
8. Taking average over all variables grouped by activity and subject
9. Storing data to tidy.txt 

## Using tidy data

Data was saved using write.table command, so best way to look it is probably
using R read.table command

```
df <- read.table("tidy.txt");
View(df);
```

## Data variables in tidy dataset

| No.|Name                                                       |Description                                                                                                                                                  |
|---:|:----------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------|
|   1|time.body.linear.acceleration.mean.x.avg                   |Average grouped by activity and subject over time domain linear acceleration signal body component mean of 2.56 sec window on X-axis                         |
|   2|time.body.linear.acceleration.mean.y.avg                   |Average grouped by activity and subject over time domain linear acceleration signal body component mean of 2.56 sec window on Y-axis                         |
|   3|time.body.linear.acceleration.mean.z.avg                   |Average grouped by activity and subject over time domain linear acceleration signal body component mean of 2.56 sec window on Z-axis                         |
|   4|time.body.linear.acceleration.std.x.avg                    |Average grouped by activity and subject over time domain linear acceleration signal body component standard deviation of 2.56 sec window on X-axis           |
|   5|time.body.linear.acceleration.std.y.avg                    |Average grouped by activity and subject over time domain linear acceleration signal body component standard deviation of 2.56 sec window on Y-axis           |
|   6|time.body.linear.acceleration.std.z.avg                    |Average grouped by activity and subject over time domain linear acceleration signal body component standard deviation of 2.56 sec window on Z-axis           |
|   7|time.gravity.linear.acceleration.mean.x.avg                |Average grouped by activity and subject over time domain linear acceleration signal gravity component mean of 2.56 sec window on X-axis                      |
|   8|time.gravity.linear.acceleration.mean.y.avg                |Average grouped by activity and subject over time domain linear acceleration signal gravity component mean of 2.56 sec window on Y-axis                      |
|   9|time.gravity.linear.acceleration.mean.z.avg                |Average grouped by activity and subject over time domain linear acceleration signal gravity component mean of 2.56 sec window on Z-axis                      |
|  10|time.gravity.linear.acceleration.std.x.avg                 |Average grouped by activity and subject over time domain linear acceleration signal gravity component standard deviation of 2.56 sec window on X-axis        |
|  11|time.gravity.linear.acceleration.std.y.avg                 |Average grouped by activity and subject over time domain linear acceleration signal gravity component standard deviation of 2.56 sec window on Y-axis        |
|  12|time.gravity.linear.acceleration.std.z.avg                 |Average grouped by activity and subject over time domain linear acceleration signal gravity component standard deviation of 2.56 sec window on Z-axis        |
|  13|time.body.linear.acceleration.jerk.mean.x.avg              |Average grouped by activity and subject over time domain linear acceleration jerk signal body component mean of 2.56 sec window on X-axis                    |
|  14|time.body.linear.acceleration.jerk.mean.y.avg              |Average grouped by activity and subject over time domain linear acceleration jerk signal body component mean of 2.56 sec window on Y-axis                    |
|  15|time.body.linear.acceleration.jerk.mean.z.avg              |Average grouped by activity and subject over time domain linear acceleration jerk signal body component mean of 2.56 sec window on Z-axis                    |
|  16|time.body.linear.acceleration.jerk.std.x.avg               |Average grouped by activity and subject over time domain linear acceleration jerk signal body component standard deviation of 2.56 sec window on X-axis      |
|  17|time.body.linear.acceleration.jerk.std.y.avg               |Average grouped by activity and subject over time domain linear acceleration jerk signal body component standard deviation of 2.56 sec window on Y-axis      |
|  18|time.body.linear.acceleration.jerk.std.z.avg               |Average grouped by activity and subject over time domain linear acceleration jerk signal body component standard deviation of 2.56 sec window on Z-axis      |
|  19|time.body.angular.velocity.mean.x.avg                      |Average grouped by activity and subject over time domain angular velocity signal body component mean of 2.56 sec window on X-axis                            |
|  20|time.body.angular.velocity.mean.y.avg                      |Average grouped by activity and subject over time domain angular velocity signal body component mean of 2.56 sec window on Y-axis                            |
|  21|time.body.angular.velocity.mean.z.avg                      |Average grouped by activity and subject over time domain angular velocity signal body component mean of 2.56 sec window on Z-axis                            |
|  22|time.body.angular.velocity.std.x.avg                       |Average grouped by activity and subject over time domain angular velocity signal body component standard deviation of 2.56 sec window on X-axis              |
|  23|time.body.angular.velocity.std.y.avg                       |Average grouped by activity and subject over time domain angular velocity signal body component standard deviation of 2.56 sec window on Y-axis              |
|  24|time.body.angular.velocity.std.z.avg                       |Average grouped by activity and subject over time domain angular velocity signal body component standard deviation of 2.56 sec window on Z-axis              |
|  25|time.body.angular.velocity.jerk.mean.x.avg                 |Average grouped by activity and subject over time domain angular velocity jerk signal body component mean of 2.56 sec window on X-axis                       |
|  26|time.body.angular.velocity.jerk.mean.y.avg                 |Average grouped by activity and subject over time domain angular velocity jerk signal body component mean of 2.56 sec window on Y-axis                       |
|  27|time.body.angular.velocity.jerk.mean.z.avg                 |Average grouped by activity and subject over time domain angular velocity jerk signal body component mean of 2.56 sec window on Z-axis                       |
|  28|time.body.angular.velocity.jerk.std.x.avg                  |Average grouped by activity and subject over time domain angular velocity jerk signal body component standard deviation of 2.56 sec window on X-axis         |
|  29|time.body.angular.velocity.jerk.std.y.avg                  |Average grouped by activity and subject over time domain angular velocity jerk signal body component standard deviation of 2.56 sec window on Y-axis         |
|  30|time.body.angular.velocity.jerk.std.z.avg                  |Average grouped by activity and subject over time domain angular velocity jerk signal body component standard deviation of 2.56 sec window on Z-axis         |
|  31|time.body.linear.acceleration.magnitude.mean.avg           |Average grouped by activity and subject over time domain linear acceleration signal body component magnitude mean of 2.56 sec window                         |
|  32|time.body.linear.acceleration.magnitude.std.avg            |Average grouped by activity and subject over time domain linear acceleration signal body component magnitude standard deviation of 2.56 sec window           |
|  33|time.gravity.linear.acceleration.magnitude.mean.avg        |Average grouped by activity and subject over time domain linear acceleration signal gravity component magnitude mean of 2.56 sec window                      |
|  34|time.gravity.linear.acceleration.magnitude.std.avg         |Average grouped by activity and subject over time domain linear acceleration signal gravity component magnitude standard deviation of 2.56 sec window        |
|  35|time.body.linear.acceleration.jerk.magnitude.mean.avg      |Average grouped by activity and subject over time domain linear acceleration jerk signal body component magnitude mean of 2.56 sec window                    |
|  36|time.body.linear.acceleration.jerk.magnitude.std.avg       |Average grouped by activity and subject over time domain linear acceleration jerk signal body component magnitude standard deviation of 2.56 sec window      |
|  37|time.body.angular.velocity.magnitude.mean.avg              |Average grouped by activity and subject over time domain angular velocity signal body component magnitude mean of 2.56 sec window                            |
|  38|time.body.angular.velocity.magnitude.std.avg               |Average grouped by activity and subject over time domain angular velocity signal body component magnitude standard deviation of 2.56 sec window              |
|  39|time.body.angular.velocity.jerk.magnitude.mean.avg         |Average grouped by activity and subject over time domain angular velocity jerk signal body component magnitude mean of 2.56 sec window                       |
|  40|time.body.angular.velocity.jerk.magnitude.std.avg          |Average grouped by activity and subject over time domain angular velocity jerk signal body component magnitude standard deviation of 2.56 sec window         |
|  41|frequency.body.linear.acceleration.mean.x.avg              |Average grouped by activity and subject over frequency domain linear acceleration signal body component mean of 2.56 sec window on X-axis                    |
|  42|frequency.body.linear.acceleration.mean.y.avg              |Average grouped by activity and subject over frequency domain linear acceleration signal body component mean of 2.56 sec window on Y-axis                    |
|  43|frequency.body.linear.acceleration.mean.z.avg              |Average grouped by activity and subject over frequency domain linear acceleration signal body component mean of 2.56 sec window on Z-axis                    |
|  44|frequency.body.linear.acceleration.std.x.avg               |Average grouped by activity and subject over frequency domain linear acceleration signal body component standard deviation of 2.56 sec window on X-axis      |
|  45|frequency.body.linear.acceleration.std.y.avg               |Average grouped by activity and subject over frequency domain linear acceleration signal body component standard deviation of 2.56 sec window on Y-axis      |
|  46|frequency.body.linear.acceleration.std.z.avg               |Average grouped by activity and subject over frequency domain linear acceleration signal body component standard deviation of 2.56 sec window on Z-axis      |
|  47|frequency.body.linear.acceleration.jerk.mean.x.avg         |Average grouped by activity and subject over frequency domain linear acceleration jerk signal body component mean of 2.56 sec window on X-axis               |
|  48|frequency.body.linear.acceleration.jerk.mean.y.avg         |Average grouped by activity and subject over frequency domain linear acceleration jerk signal body component mean of 2.56 sec window on Y-axis               |
|  49|frequency.body.linear.acceleration.jerk.mean.z.avg         |Average grouped by activity and subject over frequency domain linear acceleration jerk signal body component mean of 2.56 sec window on Z-axis               |
|  50|frequency.body.linear.acceleration.jerk.std.x.avg          |Average grouped by activity and subject over frequency domain linear acceleration jerk signal body component standard deviation of 2.56 sec window on X-axis |
|  51|frequency.body.linear.acceleration.jerk.std.y.avg          |Average grouped by activity and subject over frequency domain linear acceleration jerk signal body component standard deviation of 2.56 sec window on Y-axis |
|  52|frequency.body.linear.acceleration.jerk.std.z.avg          |Average grouped by activity and subject over frequency domain linear acceleration jerk signal body component standard deviation of 2.56 sec window on Z-axis |
|  53|frequency.body.angular.velocity.mean.x.avg                 |Average grouped by activity and subject over frequency domain angular velocity signal body component mean of 2.56 sec window on X-axis                       |
|  54|frequency.body.angular.velocity.mean.y.avg                 |Average grouped by activity and subject over frequency domain angular velocity signal body component mean of 2.56 sec window on Y-axis                       |
|  55|frequency.body.angular.velocity.mean.z.avg                 |Average grouped by activity and subject over frequency domain angular velocity signal body component mean of 2.56 sec window on Z-axis                       |
|  56|frequency.body.angular.velocity.std.x.avg                  |Average grouped by activity and subject over frequency domain angular velocity signal body component standard deviation of 2.56 sec window on X-axis         |
|  57|frequency.body.angular.velocity.std.y.avg                  |Average grouped by activity and subject over frequency domain angular velocity signal body component standard deviation of 2.56 sec window on Y-axis         |
|  58|frequency.body.angular.velocity.std.z.avg                  |Average grouped by activity and subject over frequency domain angular velocity signal body component standard deviation of 2.56 sec window on Z-axis         |
|  59|frequency.body.linear.acceleration.magnitude.mean.avg      |Average grouped by activity and subject over frequency domain linear acceleration signal body component magnitude mean of 2.56 sec window                    |
|  60|frequency.body.linear.acceleration.magnitude.std.avg       |Average grouped by activity and subject over frequency domain linear acceleration signal body component magnitude standard deviation of 2.56 sec window      |
|  61|frequency.body.linear.acceleration.jerk.magnitude.mean.avg |Average grouped by activity and subject over frequency domain linear acceleration jerk signal body component magnitude mean of 2.56 sec window               |
|  62|frequency.body.linear.acceleration.jerk.magnitude.std.avg  |Average grouped by activity and subject over frequency domain linear acceleration jerk signal body component magnitude standard deviation of 2.56 sec window |
|  63|frequency.body.angular.velocity.magnitude.mean.avg         |Average grouped by activity and subject over frequency domain angular velocity signal body component magnitude mean of 2.56 sec window                       |
|  64|frequency.body.angular.velocity.magnitude.std.avg          |Average grouped by activity and subject over frequency domain angular velocity signal body component magnitude standard deviation of 2.56 sec window         |
|  65|frequency.body.angular.velocity.jerk.magnitude.mean.avg    |Average grouped by activity and subject over frequency domain angular velocity jerk signal body component magnitude mean of 2.56 sec window                  |
|  66|frequency.body.angular.velocity.jerk.magnitude.std.avg     |Average grouped by activity and subject over frequency domain angular velocity jerk signal body component magnitude standard deviation of 2.56 sec window    |
|  67|activity                                                   |Activity performed by subject, one of 'WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING'                                        |
|  68|subject                                                    |Subject performing activity, 1 - 30                                                                                                                          |
