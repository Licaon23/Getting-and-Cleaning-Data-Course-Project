############################## RUN ANALYSIS SCRIPT ####################################
#                                                                                     #
#  The purpose of this R script is to clean and organize the "UCI HAR Dataset". As    #
# a result, it gives two tidy datasets, which are saved as a .txt file in a new       #
# directory called /cleanDatasets. A description of those datasets, "tidyDataset.txt" #
# and "averageDataset.txt" are given in the codebook relative to that script.         #
#                                                                                     #
#  Before running this script, IT IS IMPORTANT to set the working directory where all # 
# the files of the UCI HAR Dataset are, usually a directory or folder you get after   # 
# unzipping the compressed file.                                                      #                                                   
#                                                                                     #
#######################################################################################

run_analysis <- function() {

library(reshape2)

# 1) Read the data in R and merge the train and test datasets
measurements <- rbind(read.table("./train/x_train.txt",colClasses="numeric"),
                      read.table("./test/x_test.txt",colClasses="numeric"))

activity <- rbind(read.table("./train/y_train.txt",colClasses="integer"),
                  read.table("./test/y_test.txt",colClasses="integer"))
        
subject <- rbind(read.table("./train/subject_train.txt",colClasses="integer"),
                 read.table("./test/subject_test.txt",colClasses="integer"))

features_label <- read.table("./features.txt",colClasses=c("integer","character"))

activity_label <- read.table("./activity_labels.txt",colClasses=c("integer",
                                                                  "character"))
# 2) Select the mean and std variables from "measurements" 
variables_to_subset <- grep("mean([^Freq])|std",features_label[[2]])
measurements <- measurements[,variables_to_subset]

# 3) Name the activities acording to its ID and label the measurement variables
activity <- merge(activity,activity_label,sort=FALSE)
features_label <- features_label[variables_to_subset,]

# 4) Gather up all the necessary variables in a tidy dataset
tidy_dataset <- cbind(subject,activity[[2]],measurements)
names(tidy_dataset) <- c("subject","activity",features_label[[2]])

# 5) Creat a new tidy dataset with the average value of each variable for each activity
tidy_dataset_melt <- melt(tidy_dataset,id=c("subject","activity"))
average_variable_dataset <- dcast(tidy_dataset_melt,variable~activity,mean)

# 6) Write datasets into a .txt file, separated by spaces and with column names.
if(!file.exists("cleanDatasets")){dir.create("cleanDatasets")}

write.table(tidy_dataset,file="./cleanDatasets/tidyDataset.txt",col.names=T,
            quote=F,sep=" ",row.names=F)
write.table(average_variable_dataset,file="./cleanDatasets/averageDataset.txt",
            col.names=T,quote=F,sep=" ",row.names=F)
}

        