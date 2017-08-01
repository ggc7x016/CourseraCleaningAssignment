#Getting the file and unzip all files in working directory
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile<-paste0(getwd(),"/","CleaningAssignment.zip")
download.file(url,destfile,method = "curl")
unzip("CleaningAssignment.zip",junkpaths = TRUE)

#Load required packages
library(dplyr)
library(data.table)

#Read feature names and activity labels
features<-read.table("features.txt",header = FALSE)
activity_labels<-read.table("activity_labels.txt", header = FALSE)

#reading the train files
features_train<-read.table("X_train.txt",header = FALSE)
activities_train<-read.table("Y_train.txt",header=FALSE)
subjects_train<-read.table("subject_train.txt",header=FALSE)
bodyAccX_train<-read.table("body_acc_x_train.txt",header=FALSE)
bodyAccY_train<-read.table("body_acc_y_train.txt",header=FALSE)
bodyAccZ_train<-read.table("body_acc_z_train.txt",header=FALSE)
bodyGyroX_train<-read.table("body_gyro_x_train.txt",header=FALSE)
bodyGyroY_train<-read.table("body_gyro_y_train.txt",header=FALSE)
bodyGyroZ_train<-read.table("body_gyro_z_train.txt",header=FALSE)
totalAccX_train<-read.table("total_acc_x_train.txt",header=FALSE)
totalAccY_train<-read.table("total_acc_y_train.txt",header=FALSE)
totalAccZ_train<-read.table("total_acc_z_train.txt",header=FALSE)

#reading the test files
features_test<-read.table("X_test.txt",header = FALSE)
activities_test<-read.table("Y_test.txt",header=FALSE)
subjects_test<-read.table("subject_test.txt",header=FALSE)
bodyAccX_test<-read.table("body_acc_x_test.txt",header=FALSE)
bodyAccY_test<-read.table("body_acc_y_test.txt",header=FALSE)
bodyAccZ_test<-read.table("body_acc_z_test.txt",header=FALSE)
bodyGyroX_test<-read.table("body_gyro_x_test.txt",header=FALSE)
bodyGyroY_test<-read.table("body_gyro_y_test.txt",header=FALSE)
bodyGyroZ_test<-read.table("body_gyro_z_test.txt",header=FALSE)
totalAccX_test<-read.table("total_acc_x_test.txt",header=FALSE)
totalAccY_test<-read.table("total_acc_y_test.txt",header=FALSE)
totalAccZ_test<-read.table("total_acc_z_test.txt",header=FALSE)

#rename columns in features sets
names(features_train)<-features$V2
names(features_test)<-features$V2

#rename columns in activities sets
names(activities_train)<-"activity"
names(activities_test)<-"activity"

#rename columns in subjects sets
names(subjects_train)<-"subject"
names(subjects_test)<-"subject"

#add subject,activity and feature sets to respective train & test sets
sub_act_feat_train=cbind(subjects_train,activities_train,features_train)
sub_act_feat_test=cbind(subjects_test,activities_test,features_test)

#Q1: Merged data set for train and test sets
subActFeatures_both<-rbind(sub_act_feat_train,sub_act_feat_test)

#Making colnames unique
valid_column_names <- make.names(names=names(subActFeatures_both), 
					   unique=TRUE, allow_ = TRUE)

names(subActFeatures_both) <- valid_column_names


#Q2: Extract mean & SD related columns for each measurement
subActMeanStd_both<-subActFeatures_both%>%
				select(subject, activity, matches('mean|std'))

#Q3: Update activies names to be descriptive
subActFeatures_both_descAct<-subActFeatures_both%>% 
  					arrange(activity) %>% 
 					mutate(activity = 
						as.character(factor(activity, 
						levels=1:6, labels= activity_labels$V2)))

#Q4: Update variable names to be descriptive
names(subActFeatures_both_descAct)<-gsub("tBodyAccMag","Body.acceleration.time.domain.FFT.from accelerometer",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("tBodyAcc","Body.acceleration.time.domain.from.accelerometer",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("tBodyAccJerkMag","Body.acceleration.jerk.time.domain.FFT.from.accelerometer",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("tBodyAccJerk","Body.acceleration.jerk..time.domain.from.accelerometer",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("tGravityAccMag","Gravity.acceleration.time.domain.FFT.from.accelerometer",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("tGravityAcc","Gravity.acceleration.time.domain.from.accelerometer",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("tBodyGyroMag","Body.acceleration.time.domain.FFT.from.gyroscope",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("tBodyGyro","Body.acceleration.time.domain.from.gyroscope",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("tBodyGyroJerkMag","Body.acceleration.jerk.time.domain.FFT.from.gyroscope",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("tBodyGyroJerk","Body.acceleration.jerk.time.domain.from.gyroscope",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("fBodyAccMag","Body.acceleration.freq.domain.FFT.from.accelerometer",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("fBodyAcc","Body.acceleration.freq.domain.from.accelerometer",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("fBodyAccJerkMag","Body.acceleration.jerk.freq.domain.FFT.from.accelerometer",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("fBodyBodyAccJerkMag","Body.Body.acceleration.jerk.freq.domain.FFT.from.accelerometer",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("fBodyAccJerk","Body.acceleration.jerk.freq.domain.from.accelerometer",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("fBodyGyroMag","Body.acceleration.freq.domain.FFT.from.gyroscope",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("fBodyBodyGyroMag","Body.Body.acceleration.freq.domain.FFT.from.gyroscope",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("fBodyGyro","Body.acceleration.freq.domain.from.gyroscope",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("fBodyGyroJerkMag","Body.acceleration.jerk.freq.domain.FFT.from.gyroscope",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("fBodyBodyGyroJerkMag","Body.Body.acceleration.jerk.freq.domain.FFT.from.gyroscope",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("fBodyGyroJerk","Body.acceleration.jerk.freq.domain.from.gyroscope",names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("mean()", "MEAN", names(subActFeatures_both_descAct))
names(subActFeatures_both_descAct)<-gsub("std()", "SD", names(subActFeatures_both_descAct))


#Q5:tidy data set with the average of each variable for each subject & activity
tidydata<-subActFeatures_both_descAct%>%
		group_by(subject,activity)%>%
		summarise_all(mean)

write.table(tidydata, "TidyData.txt", row.name=FALSE)


