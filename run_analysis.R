# run_analysis.R
# by Siim AuS for Coursera getdata-10 course project
# 
# For longer description, see README
#


runAnalysis <- function(path = ".", operation="", outputfile=NULL) {
          
  #===========================================================================
  # function checks for existance of raw data files
  #===========================================================================
  testRawData <- function(path = ".") {      
    files <- c(    
      "activity_labels.txt"
      , "features.txt"
      , "test/subject_test.txt"
      , "test/X_test.txt"
      , "test/y_test.txt"
      , "train/subject_train.txt"
      , "train/X_train.txt"
      , "train/y_train.txt")
    
    check <- sapply(files, function(x) { 
      if (!file.exists(paste(path, x, sep = "/"))) F else T; });
    
    if (sum(check) < 8) {
        df <- data.frame(file=files, found=check, row.names = NULL)
        df[, 1] <- paste(getwd(), df[, 1], sep="/")
        print(df)        
        stop("Some or all required raw data files above not found.")
        return(F);
    }
    return(T);
  }
  
  #===========================================================================  
  # Function fixes up column names to conform to R requirements
  #===========================================================================
  improveColumnNames <- function(x = NULL) {
    
    # can supply no value to input
    if (missing(x)) x <- feature.rawnames;
    
    x <- gsub("BodyBody", "Body", x)
    x <- gsub("\\-", ".", x)
    x <- gsub("\\(", "", x)
    x <- gsub("\\)", "", x)
    x <- gsub(",", "to", x)
    x <- gsub("^t", "time.", x)
    x <- gsub("^f", "frequency.", x)
    x <- gsub("Mag\\.", ".magnitude.", x)
    x <- gsub("\\.Body", ".body.", x)
    x <- gsub("\\.Gravity", ".gravity.", x)
    x <- gsub("Jerk\\.", ".jerk.", x)
    x <- gsub("Acc\\.", "linear.acceleration.", x)
    x <- gsub("Gyro\\.", "angular.velocity.", x)
    x <- tolower(x)
    x <- gsub("$", ".avg", x)
  }
  
  #===========================================================================  
  # Function writes codebook descriptions 
  #===========================================================================
  writeCodeBook <- function(filename = "CodeBook.Rmd") {
    df <- data.frame(feature.improvednames, stringsAsFactors = FALSE);
    df[,c("Desc")] <- df[, 1];
    
    df[,c("Desc")]  <- gsub("\\.", " ",   df[,c("Desc")])
    df[,c("Desc")]  <- gsub("time ", "Average grouped by activity and subject over time domain ",   df[,c("Desc")])  
    df[,c("Desc")]  <- gsub("frequency ", "Average grouped by activity and subject over frequency domain ",   df[,c("Desc")])
    df[,c("Desc")]  <- gsub("body", "body component ",   df[,c("Desc")])
    df[,c("Desc")]  <- gsub("gravity", " gravity component ",   df[,c("Desc")])
    df[,c("Desc")]  <- gsub("acceleration ", "acceleration signal ",   df[,c("Desc")])
    df[,c("Desc")]  <- gsub("velocity ", "velocity signal ",   df[,c("Desc")])
    
    df[,c("Desc")]  <- gsub("mean ", "mean of 2.56 sec window ",   df[,c("Desc")])
    df[,c("Desc")]  <- gsub("std ", "standard deviation of 2.56 sec window ",   df[,c("Desc")])
    df[,c("Desc")]  <- gsub(" x ", " on X-axis ",   df[,c("Desc")])
    df[,c("Desc")]  <- gsub(" y ", " on Y-axis ",   df[,c("Desc")])
    df[,c("Desc")]  <- gsub(" z ", " on Z-axis ",   df[,c("Desc")])
    
    df[,c("Desc")]  <- gsub(" signal jerk ", " jerk signal ",   df[,c("Desc")])
    
    df[,c("Desc")]  <- gsub("(^.* domain)*( .* component)+(.* signal)+(.*$)+", "\\1\\3\\2\\4", df[,c("Desc")])    
    df[,c("Desc")]  <- gsub(" avg$", "",   df[,c("Desc")])
    
    df[,c("Desc")]  <- gsub("  ", " ",   df[,c("Desc")])
    
    df <- df[feature.columns,];    
  
    rownames(df) <- NULL 
    
    #paste()
    

    df[nrow(df)+1,] <- c("activity", 
      sprintf("Activity performed by subject, one of '%s'", 
            paste(activity.labels[,2], collapse="','") ))
                         
    df[nrow(df)+1,] <- c("subject", "Subject performing activity, 1 - 30")

    # reorder columns
    df[,3] <- df[,2]
    df[,2] <- df[,1]
    df[,1] <- 1:nrow(df);
    
    # assign column names
    colnames(df) <- c("No.", "Name", "Description");
    
    if (is.null(filename)) {
      return(df);
    } else {
      if (file.exists(filename)) {
        stop(sprint("File '%s' already exists", filename));
        return(FALSE);
      }
      library(knitr);
      
      TFile <- file(filename, "w+")
      writeLines( kable(df, format="markdown"), TFile);
      close(TFile);
    }
  }
  
  
  #===========================================================================
  # Function sets up environment
  #===========================================================================
  init <- function() {    
    
    # environment
    pe <- parent.frame();
    
    # check for initialization variable existance
    if (!exists("initialized",envir = pe, mode = "numeric" )) pe$initialized <- FALSE;
    
    if (pe$initialized == TRUE) return(TRUE);
    
        
    # test for input files
    testRawData(path);
  
    # If LaF library is installed, use it
    if (pe$has.laf <- length(grep("^LaF$", 
                                installed.packages()[,1], value=TRUE)) > 0)
      library(LaF)
  
    library(plyr);
    
    # read features names first. 
    filename <- paste(path, "features.txt", sep = "/")
    pe$features <- read.table(file = filename, header = FALSE
                        , sep = " ", stringsAsFactors=FALSE )  
    
    # Improved column names for entire features file
    pe$feature.improvednames <- improveColumnNames(features[, 2])
    
    # filter only names we need 
    pe$feature.columns <- grep("mean\\(|std\\(", features[, 2], value = FALSE)
    pe$feature.rawnames <- grep("mean\\(|std\\(", features[, 2], value = TRUE)
        
    # load activities names
    filename <- paste(path, "activity_labels.txt", sep = "/");
    pe$activity.labels <- read.table(file=filename, 
                              header=FALSE, sep=" ", stringsAsFactors = FALSE);   
    
    pe$initialized <- TRUE;
    return(TRUE);
    
  }
      
  
  #===========================================================================
  # Function to read content data. 
  # Function already extracts required columns
  # Use LaF if existing, read.table otherwise  
  #===========================================================================
  readMeasures <- function(path) {    
    if (has.laf) {
      n <- nrow(features);
      ct <- rep("double", n); 
      cl <- rep(16, n);      
      laf <- laf_open_fwf(path, ct, cl, feature.improvednames, dec=".");
      raw.data <- laf[, feature.columns];
    } else {
      raw.data <- read.table(file=filename, header=FALSE, sep="") 
      raw.data <- raw.data[,feature.columns]
      names(raw.data) <- feature.improvednames[, feature.columns];
    }
    raw.data
  }  
  
  #===========================================================================
  # Function loads either training or test dataset
  # path is used from parent environment
  #===========================================================================
  loadDataSet <- function(dataset.name) {
    
    # load train data
    filename <- paste(path, dataset.name, 
                      paste("X_", dataset.name, ".txt", sep="")
                      , sep = "/");
    load.data <- readMeasures(filename);   
    
    #  activities column
    filename <- paste(path, dataset.name, 
                      paste("y_", dataset.name, ".txt", sep="")
                      , sep = "/");
    load.activity <- read.table(file=filename, header=FALSE, sep=""); 
           
    # map activity 
    load.data$activity <- as.vector(sapply(load.activity, function(x) { 
                                as.character(activity.labels[x, 2]); }
                              ));
    # cleanup 
    rm(load.activity)
    
    #  subject column
    filename <- paste(path, dataset.name, 
                      paste("subject_", dataset.name, ".txt", sep="")
                      , sep = "/");    
    load.data$subject <- unlist(read.table(filename));

    load.data
  }
  
  #===========================================================================
  # Function creates tidy dataset required 
  # That is, calculates average of all measured values for
  # each combination of subject and activity
  #===========================================================================  
  
  tidyDataSet <- function(filename = NULL) {
  
    train.data <- loadDataSet("train")
    test.data <- loadDataSet("test")
    
    merged.data <- rbind(train.data, test.data)    
    
    # cleanup
    rm(train.data);
    rm(test.data);
    
    #factors for splitting
    factors <- factor(paste(merged.data$activity, merged.data$subject, sep=""))
    
    # split data
    split.data <- split(merged.data, factors);
    
    # calculate means
    tidy.data <- ldply(lapply(split.data, function(x) { 
        r <- colMeans(subset(x, select = -c(activity, subject))); 
        # 
        r <- as.data.frame(t(sapply(r, function(y) { y })));
        r$activity <- x$activity[1];
        r$subject <- x$subject[1];
        r;
        }));
    
    # remove id column added by ldply
    tidy.data$.id <- NULL
    
    if (!missing(filename) && !is.null(filename)) {
      
      if (file.exists(filename)) {
         stop(sprintf("File with name '%s' already exist."), filename)         
      }
      
      write.table(tidy.data, filename)
      return(TRUE)
    } 
    tidy.data      
  }  
 
  #===========================================================================
  # main function execution 
  #===========================================================================
  init();
 
  
  
 
  
  if (operation == "codebook") {      
    writeCodeBook(outputfile)
  } else {
    tidyDataSet(outputfile)
  }
  
}

runAnalysis(".", "", "tidy.txt")
