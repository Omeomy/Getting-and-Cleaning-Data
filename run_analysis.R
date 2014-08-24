require(plyr)

# load files
uci_hard_dir <- "UCI\ HAR\ Dataset"
feature_file <- paste(uci_hard_dir, "/features.txt", sep = "")
activity_labels_file <- paste(uci_hard_dir, "/activity_labels.txt", sep = "")
x_train_file <- paste(uci_hard_dir, "/train/X_train.txt", sep = "")
y_train_file <- paste(uci_hard_dir, "/train/y_train.txt", sep = "")
subject_train_file <- paste(uci_hard_dir, "/train/subject_train.txt", sep = "")
x_test_file  <- paste(uci_hard_dir, "/test/X_test.txt", sep = "")
y_test_file  <- paste(uci_hard_dir, "/test/y_test.txt", sep = "")
subject_test_file <- paste(uci_hard_dir, "/test/subject_test.txt", sep = "")

# Load raw data
features <- read.table(feature_file, colClasses = c("character"))
activity_labels <- read.table(activity_labels_file, col.names = c("ActivityId", "Activity"))
x_train <- read.table(x_train_file)
y_train <- read.table(y_train_file)
subject_train <- read.table(subject_train_file)
x_test <- read.table(x_test_file)
y_test <- read.table(y_test_file)
subject_test <- read.table(subject_test_file)


# 1. Binding data
merge_train_data <- cbind(cbind(x_train, subject_train), y_train)
merge_test_data <- cbind(cbind(x_test, subject_test), y_test)
data <- rbind(merge_train_data, merge_test_data)
labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(data) <-labels


# 2. Extracts  mean and standard deviation 

data_mean_std <- data[,grepl("mean|std|Subject|ActivityId", names(data))]

# 3. Name the activities in the data set


data_mean_std <- join(data_mean_std, activity_labels, by = "ActivityId", match = "first")
data_mean_std <- data_mean_std[,-1]


# 4. labels the data set 


# delete ( )
names(data_mean_std) <- gsub('\\(|\\)',"",names(data_mean_std), perl = TRUE)

# valid names
names(data_mean_std) <- make.names(names(data_mean_std))

# Make New names
names(data_mean_std) <- gsub('Acc',"Acceleration",names(data_mean_std))
names(data_mean_std) <- gsub('GyroJerk',"AngularAcceleration",names(data_mean_std))
names(data_mean_std) <- gsub('Gyro',"AngularSpeed",names(data_mean_std))
names(data_mean_std) <- gsub('Mag',"Magnitude",names(data_mean_std))
names(data_mean_std) <- gsub('^t',"T_Domain.",names(data_mean_std))
names(data_mean_std) <- gsub('^f',"F_Domain.",names(data_mean_std))
names(data_mean_std) <- gsub('\\.mean',".Mean",names(data_mean_std))
names(data_mean_std) <- gsub('\\.std',".StandardDeviation",names(data_mean_std))
names(data_mean_std) <- gsub('Freq\\.',"Frequency.",names(data_mean_std))
names(data_mean_std) <- gsub('Freq$',"Frequency",names(data_mean_std))


# 5. Creates tidy data set 

tidy data = ddply(data_mean_std, c("Subject","Activity"), numcolwise(mean))
write.table(tidy data, file = "tidy data.txt")
