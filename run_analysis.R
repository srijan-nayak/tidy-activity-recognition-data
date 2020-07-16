library(dplyr)
library(readr)

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
