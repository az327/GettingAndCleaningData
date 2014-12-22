
features<-as.vector(read.table("./features.txt",stringsAsFactors=FALSE)[,2]) #variable names (dim 561, 1)

test_set<-read.table("./test/X_test.txt",col.names=features) #test results 2947 rows 561 columns (V1, V2, V3,...)
test_labels<-read.table("./test/y_test.txt",col.names="activity_label") #activity labels 2947 rows with values 1:6
test_subject_id<-read.table("./test/subject_test.txt",col.names="subject_id") #subject IDs 2947 rows with 9 unique values
test_data<-cbind(test_subject_id, subject_category=rep("test",each=2947), test_labels,test_set) # 2947 rows 564 columns

train_set<-read.table("./train/X_train.txt", col.names=features) #7352 rows 561 columns
train_labels<-read.table("./train/y_train.txt",col.names="activity_label") #7352 rows with values 1:6
train_subject_id<-read.table("./train/subject_train.txt",col.names="subject_id") #7352 rows with 11 unique values
train_data<-cbind(train_subject_id,subject_category=rep("train",each=7352), train_labels,train_set) #7352 rows 564 columns

library(dplyr)

#replace activity labels with descriptive namves
merged_data<-merge(test_data,train_data,all=TRUE) #10299 rows, 564 columns
merged_data$activity_label[merged_data$activity_label==1]<-"WALKING"
merged_data$activity_label[merged_data$activity_label==2]<-"WALKING_UPSTAIRS"
merged_data$activity_label[merged_data$activity_label==3]<-"WALKING_DOWNSTAIRS"
merged_data$activity_label[merged_data$activity_label==4]<-"SITTING"
merged_data$activity_label[merged_data$activity_label==5]<-"STANDING"
merged_data$activity_label[merged_data$activity_label==6]<-"LAYING"

#select relevant columns and bind
final_data1<-merged_data[,c("subject_id","subject_category","activity_label")]
#select columns with "mean" or "std" in the name
final_data2<-merged_data[,c(grep("mean",colnames(merged_data)),grep("std",colnames(merged_data)))]
final_data<-cbind(final_data1,final_data2) #final data set

#create table for means
mean_table<-aggregate(final_data[,4:82],list(final_data$subject_id, final_data$activity_label),mean)

write.table(mean_table,"mean_table.txt",row.names=FALSE)
