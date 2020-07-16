library(dplyr)
library(readr)
library(stringr)

# download and unzip the raw data
download.file(
  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
  destfile = "uci-har.zip"
)
unzip("./uci-har.zip")

# read and extract the names of the 561 features
features <- read_table2("./UCI HAR Dataset/features.txt",
                        col_names = c("featurenum", "featurename"))
feature_names <- features$featurename

# read the x train and test sets
x_train <- read_table2("./UCI HAR Dataset/train/X_train.txt",
                       col_names = feature_names)
x_test <- read_table2("./UCI HAR Dataset/test/X_test.txt",
                      col_names = feature_names)

# read in the subjects for each dataset
subject_train <- read_lines("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read_lines("./UCI HAR Dataset/test/subject_test.txt")

# create new subject column
x_train <- x_train %>% 
  mutate(subject = parse_integer(subject_train)) %>% 
  select(subject, everything())
x_test <- x_test %>% 
  mutate(subject = parse_integer(subject_test)) %>% 
  select(subject, everything())

# read in the activity labels for each column
activity_train <- read_lines("./UCI HAR Dataset/train/y_train.txt")
activity_test <- read_lines("./UCI HAR Dataset/test/y_test.txt")

# create new activity column
x_train <- x_train %>% 
  mutate(activity = parse_integer(activity_train)) %>% 
  select(subject, activity, everything())
x_test <- x_test %>% 
  mutate(activity = parse_integer(activity_test)) %>% 
  select(subject, activity, everything())

# merge both train and test datasets
merged_data <- rbind(x_train, x_test)

# get the labels for each activity number
activity_labels <- read_table2("UCI HAR Dataset/activity_labels.txt",
                               col_names = c("activity", "label"))

# change label formatting from 'UPPER_CASE' to 'lower case' 
activity_labels <- activity_labels %>% 
  mutate(label = {
    lower_split <- strsplit(tolower(label), "_")
    sapply(lower_split, function(el) paste(el, collapse = " "))
  }) %>% arrange(activity)

# transform the activity numbers to activity names
merged_data <- merged_data %>% 
  mutate(activity = activity_labels$label[activity])

# select only the mean and std for each measurement
variables <- colnames(merged_data)
req_variables <- grep("(mean|std)\\(\\)", variables, value = TRUE)
req_data <- merged_data %>% 
  select(subject, activity, req_variables)

# make all variable names lower case without special characters
col_names <- colnames(req_data) %>% 
  tolower() %>% 
  strsplit("-") %>% 
  sapply(function(el) paste(el, collapse = "")) %>% 
  str_replace("\\(\\)", "")
colnames(req_data) <- col_names

# take the average of all measurement by activity and subject
final_data <- req_data %>% 
  group_by(subject, activity) %>% 
  summarise(across(.fns = mean))

# export the tidy summary data to a csv file
write.table(final_data, "tidy-har-summary.txt")
