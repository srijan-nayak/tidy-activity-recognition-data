# download and unzip the raw data
download.file(
  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
  destfile = "uci-har.zip"
)
unzip("uci-har.zip")
