<h1 id="cleaning-data-assignment"><strong>Cleaning Data Assignment</strong></h1>



<h3 id="files-in-this-repo">Files in this repo</h3>

<p>README.md – You are reading it right now <br>
CodeBook.md – codebook describes the variables, the data and transformations for understanding the data table <br>
run_analysis.R – R code to analyse the data and clean as required</p>



<h3 id="description-of-the-data">Description of the DATA</h3>

<p>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix Î÷ÎõtÎéÎ÷ to denote time) were captured at a constant rate of 50 Hz. and the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) ÎíÎñ both using a low pass Butterworth filter.</p>

<p>The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).</p>

<p>A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the Î÷ÎõfÎéÎ÷ to indicate frequency domain signals).</p>



<h3 id="description-of-abbreviations-of-measurements">Description of abbreviations of measurements</h3>

<p>*leading t or f is based on time or frequency measurements. *Body = related to body movement. *Gravity = acceleration of gravity *Acc = accelerometer measurement *Gyro = gyroscopic measurements *Jerk = sudden movement acceleration *Mag = magnitude of movement *mean and SD are calculated for each subject for each activity for each mean and SD measurements.</p>

<p>The units given are gÎéÎ÷s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.</p>

<p>These signals were used to estimate variables of the feature vector for each pattern: Î÷Îõ-XYZÎéÎ÷ is used to denote 3-axial signals in the X, Y and Z directions. They total 33 measurements including the 3 dimensions - the X,Y, and Z axes.</p>

<p>tBodyAcc-XYZ <br>
tGravityAcc-XYZ <br>
tBodyAccJerk-XYZ <br>
tBodyGyro-XYZ <br>
tBodyGyroJerk-XYZ <br>
tBodyAccMag <br>
tGravityAccMag <br>
tBodyAccJerkMag <br>
tBodyGyroMag <br>
tBodyGyroJerkMag <br>
fBodyAcc-XYZ <br>
fBodyAccJerk-XYZ <br>
fBodyGyro-XYZ <br>
fBodyAccMag <br>
fBodyAccJerkMag <br>
fBodyGyroMag <br>
fBodyGyroJerkMag</p>

<p>The set of variables that were estimated from these signals are:</p>

<ul>
<li>mean(): Mean value</li>
<li>std(): Standard deviation</li>
</ul>



<h3 id="data-set-information">Data Set Information:</h3>

<p>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.</p>

<p>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.</p>



<h3 id="libraries-used-in-runanalysisr">libraries used in run_analysis.R</h3>

<p>library(dplyr) <br>
library(data.table)</p>
