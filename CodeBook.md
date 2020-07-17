# UCI Human Activity Recognition Summarized Dataset Codebook

- - -

### `subject`

Tells which subject was performing a given activity.

Values range from 1-30. According to the orginal data source:

> The experiments have been carried out with a group of 30 volunteers within an
> age bracket of 19-48 years.

### `activity`

Tells which activity the subject was performing.

Possible valuees are:

* `laying`
* `sitting`
* `standing`
* `walking`
* `walking downstairs`
* `walking upstairs`

## Time domain signals

According to the original data source:

> The features selected for this database come from the accelerometer and
> gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
> signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.
> Then they were filtered using a median filter and a 3rd order low pass
> Butterworth filter with a corner frequency of 20 Hz to remove noise.
> Similarly, the acceleration signal was then separated into body and gravity
> acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass
> Butterworth filter with a corner frequency of 0.3 Hz.
>
> Subsequently, the body linear acceleration and angular velocity were derived
> in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also
> the magnitude of these three-dimensional signals were calculated using the
> Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag,
> tBodyGyroJerkMag).
> 
> These signals were used to estimate variables of the feature vector for each
> pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Of all the time domain signal measurements, only the means and standard
deviations of the measurements, denoted by `mean` and `std` in the variable
names respectively, were selected and the average of these variables were taken
for each activity performed by a given subject.

The variable names were not changed much as the names were self explanatory
as described in the quote above. The only changes made were transforming the
names to lower case and removing any special characters as suggested in
[this lecture](https://www.coursera.org/learn/data-cleaning/lecture/drpnT/editing-text-variables).

The time domain signal variables are as follows:

* `tbodyaccmeanx`
* `tbodyaccmeany`
* `tbodyaccmeanz`
* `tbodyaccstdx`
* `tbodyaccstdy`
* `tbodyaccstdz`
* `tgravityaccmeanx`
* `tgravityaccmeany`
* `tgravityaccmeanz`
* `tgravityaccstdx`
* `tgravityaccstdy`
* `tgravityaccstdz`
* `tbodyaccjerkmeanx`
* `tbodyaccjerkmeany`
* `tbodyaccjerkmeanz`
* `tbodyaccjerkstdx`
* `tbodyaccjerkstdy`
* `tbodyaccjerkstdz`
* `tbodygyromeanx`
* `tbodygyromeany`
* `tbodygyromeanz`
* `tbodygyrostdx`
* `tbodygyrostdy`
* `tbodygyrostdz`
* `tbodygyrojerkmeanx`
* `tbodygyrojerkmeany`
* `tbodygyrojerkmeanz`
* `tbodygyrojerkstdx`
* `tbodygyrojerkstdy`
* `tbodygyrojerkstdz`
* `tbodyaccmagmean`
* `tbodyaccmagstd`
* `tgravityaccmagmean`
* `tgravityaccmagstd`
* `tbodyaccjerkmagmean`
* `tbodyaccjerkmagstd`
* `tbodygyromagmean`
* `tbodygyromagstd`
* `tbodygyrojerkmagmean`
* `tbodygyrojerkmagstd`

## Frequency domain signals

Again, referring to the original data scource:

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals
> producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
> fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain
> signals).

Just like with the time domain signal variables, only the means and standard
deviations of the measurements, denoted by `mean` and `std` in the variable
names respectively, were selected and the average of these variables were taken
for each activity performed by a given subject.

The variable names were also transformed in the same way as described above.

The frequency domain signal variables are as follows:

* `fbodyaccmeanx`
* `fbodyaccmeany`
* `fbodyaccmeanz`
* `fbodyaccstdx`
* `fbodyaccstdy`
* `fbodyaccstdz`
* `fbodyaccjerkmeanx`
* `fbodyaccjerkmeany`
* `fbodyaccjerkmeanz`
* `fbodyaccjerkstdx`
* `fbodyaccjerkstdy`
* `fbodyaccjerkstdz`
* `fbodygyromeanx`
* `fbodygyromeany`
* `fbodygyromeanz`
* `fbodygyrostdx`
* `fbodygyrostdy`
* `fbodygyrostdz`
* `fbodyaccmagmean`
* `fbodyaccmagstd`
* `fbodybodyaccjerkmagmean`
* `fbodybodyaccjerkmagstd`
* `fbodybodygyromagmean`
* `fbodybodygyromagstd`
* `fbodybodygyrojerkmagmean`
* `fbodybodygyrojerkmagstd`
