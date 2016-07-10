run_analysis <- function (){
        
        # Loading common data
        activities <- read.table("activity_labels.txt",
                header=FALSE, col.names = c("activity_code","activity_label"))
        features <- read.table("features.txt",
                header = FALSE, col.names = c("feature_code","feature_label"))

        # Loading test data
        subject_test <- read.table("test/subject_test.txt")
        test_activities <- read.table("test/y_test.txt")
        test_set <- read.table("test/X_test.txt")

        # loading train data
        subject_train <- read.table("train/subject_train.txt")
        train_activities <- read.table("train/y_train.txt")
        train_set <- read.table("train/X_train.txt")

        # Step 1: merging test and train
        test_complete <- cbind(subject_test,test_activities,test_set)
        train_complete <- cbind(subject_train,train_activities,train_set)
        observations <- rbind(test_complete,train_complete)
        colnames(observations) <- c("subject","activity",
                as.vector(features$feature_label))

        # Step 2: extracting measurements on the mean and standard deviation
        col_mean_std <- grep("mean|std", names(observations))
        observations_mean_std <- observations[, c(1,2,3,col_mean_std)]
        col_mean_std_notFreq <- grep("Freq", names(observations_mean_std), invert = TRUE)
        observations_mean_std_notFreq <- observations_mean_std[,col_mean_std_notFreq]

        # Step 3: descriptive activity names in the data set
        library(dplyr)
        observations_activities <- 
                merge(observations_mean_std_notFreq, activities, by.x = "activity", by.y = "activity_code") %>%
                select(2,70,3:69)

        # Step 4: descriptive variable names
        names(observations_activities) <- gsub("\\(","",names(observations_activities))
        names(observations_activities) <- gsub("\\)","",names(observations_activities))
        names(observations_activities) <- gsub("-","",names(observations_activities))

        # Step 5: average of each variable for activity and subject
        library(stats)
        summarised_data <- aggregate(observations_activities[3:69],by = observations_activities[c("subject","activity_label")], FUN=mean)

        write.table(summarised_data, "summarised_data.txt")

}