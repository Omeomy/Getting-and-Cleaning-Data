Getting and Cleaning Data Course Project





Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 



You will be required to submit:\n

- tidy data set as described below.
- link to a Github repository with your script for performing the analysis.
- code book that describes the variables, the data, and any transformations
- work that you performed to clean up the data called CodeBook.md. 
- You should also include a README.md in the repo with your scripts. 
- This file explains how all of the scripts work and how they are connected. 


A full description is available at the site where the data was obtained: \n
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: \n
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.\n


Merges the training and the test sets to create one data set.

Extracts only the measurements on the mean and standard deviation for each measurement. 

Uses descriptive activity names to name the activities in the data set

Appropriately labels the data set with descriptive activity names. 

Creates independent tidy data set with the average of each variable for each activity and each subject. 



What you find in this repository\n

CodeBook.md:

README.md: 

run_analysis.R: 



How to create the tidy data set

1.cleaning-data-2014-project.git  

2.download compressed raw data 

3.unzip raw data and copy the directory  UCI HAR Dataset  to the cloned repository root directory

4.open a R console and set the working directory to the repository root (use setwd())

5.source run_analisys.R script (install plyr package)  

In the repository root directory you find the file tidy_data.txt 
