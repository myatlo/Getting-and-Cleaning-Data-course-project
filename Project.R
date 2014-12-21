#Script for Getting anf Cleaning Data course project
project<-function(trainx,testx) {
	# STEP 1 Merge training and test sets
	#Read data
	#trainx<-read.table("X_train.txt")
	trainy<-read.table("y_train.txt")
	trains<-read.table("subject_train.txt")
	#testx<- read.table("X_test.txt")
	testy<- read.table("y_test.txt")
	tests<- read.table("subject_test.txt")
	
	#merging train and test datasets
	x<-rbind(trainx,testx)
	y<-rbind(trainy,testy)
	subject<-rbind(trains,tests)
	
	#STEP 2 Extract only data on the mean and standard deviation
	#read features, they are in 2nd column of data in features.txt 
	features <- read.table("features.txt")
	# get only features with mean() or std() in their names (2nd column of features)
	mean_std<-grep("-(mean|std)\\(\\)", features[, 2])
	#subset necessary columns of x
	x<-x[, mean_std]
		
	#STEP 3 and 4 Label the data set with descriptive variable names and 
	#Use descriptive activity names to name activities
	#Set descriptive variable names to x columns
	#we have indexes of corresponding (to mean() and sd()) rows in mean_std
	names(x) <- features[mean_std, 2]
	#read names of activities
	act<-read.table("activity_labels.txt")
	#update y with correct activity names
	names(y) <- "activity"
	y[, 1] <- act[y[, 1], 2]
	names(subject) <- "subject"
	#merge all the data in a single data set - merge by columns!!!
	data <- cbind(x,y,subject)
	#all raws of data have descriptive feature - activity names	

	#STEP 5 Create tidy data set with the average of each variable for each activity and each subject
	#Total number of columns - 68, last two are activity and subject
	library(plyr)
	average<-ddply(data, .(subject, activity), function(x) colMeans(x[, 1:66]))
	#write table into file
	write.table(average, "averages_tidy.txt")
}