# UIC HAR Summarised Tidy Dataset

To generate the summarised *tidy* dataset, run `run_analysis.R` in an R console
from the root project directory with

    source("run_analysis.R")
    
## Downloading data

The script first downloads and unzips the required data, so the script might
a while depending on the internet connection.

## Reading both train and test data

### Assigning column names

Once the required raw data is downloaded and unzipped, the column names for the
datasets in `X_train.txt` and `X_test.txt` are extracted from `features.txt`.
These column names are then then assigned to the `x_train` and `x_test` dataset
while importing them.

### Assigning subject data

Each row of observation was taken from a particular test subject. This data is
read from `subject_train.txt` and `subject_test.txt` for `x_train` and `x_test`
respectively. Next, this subject data is assigned to a new column `subject` in
both datasets.

### Assigning activity data

Each row of observation was taken when a subject was performing some activity.
This data is stored as integers ranging from 1-6, each integer indicating a
different activiy, in `y_train.txt` and `y_test.txt`. This data is read and then
assigned to a new column `activity` in `x_train` and `x_test` respectively.

## Preparing final dataset

### Mergin train and test datasets

The `x_train` and `x_test` datasets are merged row-wise into `merged_data`.

### Substituting activity labels

`activity_labels.txt` contains information about the activity label for a given
acitvity number. This data is read, and the label formatting is changed from
`UPPER_CASE` to `lower case`. Then the activity numbers in `merged_data` are
substituted with the appropriate activity labels.

### Selecting required variables

Only the mean and standard deviation variables for each measurement is selected.
Only variables which have `mean` or `std` just before the `()` in their names
are selected, so variables like those containing `meanFreq()` are excluded.

### Reformat the variable names

The columns names are reformated by removing special characters and making
everything lower case. Nothing else is changed as the variable names are very
descriptive as described in the [CodeBook](./CodeBook.md).

### Summarising the data

The data is first grouped by `subject` and the `activity` (in that order), and
then the average for the mean and standard deviation of every measurement is
taken. Thus the final *tidy* dataset contains the average for the mean and
standard deviation of each measurement, for every activity performed by a given
subject.

## Exporting the data

Finally, `final_data` is exported as a space separated text file called
`tidy-har-summary.txt`.
