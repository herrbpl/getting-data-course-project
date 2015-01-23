# getting-data-course-project

## Overview

This (run_analysis.R) script is meant to work with raw dataset from

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

for which compressed data is available here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Script does for given raw dataset

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each 
    measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set 
    with the average of each variable for each activity and each subject.

## Folder structure and requirements

Expected files in raw data set are:

```

ctivity_labels.txt
features.txt
features_info.txt
README.txt
test
train
test\Inertial Signals
test\subject_test.txt
test\X_test.txt
test\y_test.txt
test\Inertial Signals\body_acc_x_test.txt
test\Inertial Signals\body_acc_y_test.txt
test\Inertial Signals\body_acc_z_test.txt
test\Inertial Signals\body_gyro_x_test.txt
test\Inertial Signals\body_gyro_y_test.txt
test\Inertial Signals\body_gyro_z_test.txt
test\Inertial Signals\total_acc_x_test.txt
test\Inertial Signals\total_acc_y_test.txt
test\Inertial Signals\total_acc_z_test.txt
train\Inertial Signals
train\subject_train.txt
train\X_train.txt
train\y_train.txt
train\Inertial Signals\body_acc_x_train.txt
train\Inertial Signals\body_acc_y_train.txt
train\Inertial Signals\body_acc_z_train.txt
train\Inertial Signals\body_gyro_x_train.txt
train\Inertial Signals\body_gyro_y_train.txt
train\Inertial Signals\body_gyro_z_train.txt
train\Inertial Signals\total_acc_x_train.txt
train\Inertial Signals\total_acc_y_train.txt
train\Inertial Signals\total_acc_z_train.txt

```
## Running run_analysis.R script

Place run_analysis.R in same directory which contains test and train folders
as subfolders.

Set working directory to folder where you placed run_analysis.R and run
script. Script will generate file "tidy.txt" to same folder where run_analysis.R
is located. If file already exists or any of required input files is missing,
error message will be displayed and script stopped.

Script will also define function runAnalysis which can be run later with 
different parameters.

Parameters are:

* path - path, where function looks for raw data files (default ".")
* operation - either empty for tidy data set generation or "codebook" for 
  codebook generation (default "")
* outputfile - indicating where to save output (default NULL). If outputfile is
  NULL then data is returned instead of writing to file




### Libraries required

1. LaF
2. plyr
3. knitr (optional)

## Technical information

Following system was used to derive result:

Version of R and operating system

```
> version
               _                           
platform       x86_64-w64-mingw32          
arch           x86_64                      
os             mingw32                     
system         x86_64, mingw32             
status                                     
major          3                           
minor          1.2                         
year           2014                        
month          10                          
day            31                          
svn rev        66913                       
language       R                           
version.string R version 3.1.2 (2014-10-31)
nickname       Pumpkin Helmet          

```

Session Info

```
> sessionInfo()
R version 3.1.2 (2014-10-31)
Platform: x86_64-w64-mingw32/x64 (64-bit)

locale:
[1] LC_COLLATE=Estonian_Estonia.1257  LC_CTYPE=Estonian_Estonia.1257   
[3] LC_MONETARY=Estonian_Estonia.1257 LC_NUMERIC=C                     
[5] LC_TIME=Estonian_Estonia.1257    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] plyr_1.8.1 LaF_0.6.1 

loaded via a namespace (and not attached):
[1] digest_0.6.8    htmltools_0.2.6 Rcpp_0.11.3     rmarkdown_0.4.2 tools_3.1.2     yaml_2.1.13    

```