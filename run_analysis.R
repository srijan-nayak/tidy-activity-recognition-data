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
