Getting-and-Cleaning-Data-Course-Project
========================================

This repo contains all the files and scripts relative to the course project of the course "Getting and cleaning data"  from Coursera

* **run_analysis.R**: this is a cleaning R script, which performs all the different steps to get a tidy dataset from the raw data given in the UCI HAR dataset.
To run properly this script, follow these steps:
    1. Copy this script in the same directory as the raw data, usually in the direcotory you get when raw data is unziped.
    2. In R, set the working directory in that directory, where you have both the raw data and the script.
    3. Use the command source("run_analysis.R") to load it into R.
    4. Type run_analysis() to execute the script.

* **codeBook.md**: this markdown file describes all the variables that the R script uses, and what the different steps are.
* **cleanDatasets**: this directory contains two text files.
    1. *tidyDataset.txt*: this text file contains the first dataset that the *run_analysis.R* script gives as an output. It is described in the codeBook. As a brief idea, every row stores data from a particular experiment, the first and second column identifies the subject who performed the activity and which activitiy it was, and the rest of the columns are the mean and the standard deviation for every signal.
    2. *averageDataset.txt*: this text file stores the second tidy dataset that gives the script as an output. This one summaries the data of the *tidyDataset.txt*. It has the average value for each of the variables in the previous dataset for each activity. A deeper description can be found in the codebook. This is the dataset that we are asked to make in the fifth question in this project, and it has been posted in coursera assignment webpage too.

