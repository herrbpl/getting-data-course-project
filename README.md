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

### Libraries required

1. LaF
2. plyr

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