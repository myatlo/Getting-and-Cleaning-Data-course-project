## Introduction

Description of run_analysis.R file containing scripts for doing steps prescribed by project instructions.

STEP 1 
Firstly we read train and test data (6 files).
After that we merge train and test datasets (for the same entities) with rbind(). On this step we have datasets called x,y and subject. 

STEP 2
On this step we read features from file features.txt and find only those features, which contain mean() or std(). For this step we use function grep(), which looks for matches in data. Then, only columns with selected on previous step features are taken from main dataset (variable - x).

STEP 3 and 4
Here we combine two steps, firstly label main data set (x) with descriptive variable names for columns (which we have in variable mean_std from the previous step).
After that we read names of activities from activities.txt and update y with correct descriptive activity names.
Also we give proper descriptive names to columns in y (activity) and subject (subject).
On pre-final stage we merge x,y,subject (all have proper descriptive variable names).
We do merge with cbind(). Big dataset is called "data".
As a result  we have all raws of data with descriptive feature - activity names.

STEP 5
On final step we calculate necessary averages (ddply function) and save it to "averages_tidy.txt" file.  
