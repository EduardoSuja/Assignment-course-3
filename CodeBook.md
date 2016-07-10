CodeBook
--
title: "CodeBook.md"
author: "Eduardo Suja"
date: "10 de julio de 2016"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Description of variables, data and transformations.
### Loading common data
* "activities" contains the six rows corresponding to: walking, sitting...lying
* "features" contains the 561 measured features in the data set. The description is the one given in the assignment, see files features.txt and features_info.txt.

* subject_test will contain a column with 2947 rows, each one correponding to an observation. The value of each cell will be a value between 1 and 30, corresponding to one of the 30 volunteers for the test.
* test_activities is similar, but containing a value between 1 and 6, corresponding to the activity (sitong, laying...) of a measurement,
* test_ set is the data frame containing the 561 features for each of the 2947 observations.

* subject_train: same as subject_test, but for train, with 7352 rows.
* train_activities: same as test_activities, but for train, with 7352 rows.
* train_set: same as test_set, but for train, with 7352 rows.

## Step 1: merging test and train
* test_complete: column binding of subject_test, test_activities and test_set. It hence has 1 + 1 + 561 = 563 columns and 2947 rows.
* train_complete: same as test_complete, having 563 columns and 7352 rows.
* observations unifies test_complete and train_complete in a sole data frame, which hence will have 2947 + 7352 = 10299 rows and 563 columns. We don't need to keep the kind of observation (test or train) as we are not asked to give any information on it later.
We give to observations columns the names of the features, and for the two first columns the names "subject" and "activity"

# Step 2: extracting measurements on the mean and standard deviation
* col_mean_std is a vector with the observations names, but only those containing "mean" or "std". observations_mean_std is the data frame whose names are col_mean_std
* col_mean_std_notFreq  is a vector with the previous names whithout the sequence "Freq", and the data frame with those names. It has 10299 observations and 68 variables.

# Step 3: descriptive activity names in the data set
* observations_activities is the previous file, but replacing the activity codes by the activity labels.  It still has 10299 observations and 68 variables.

# Step 4: descriptive variable names
*observations_activities will be transformed, but maintaining the same name, to simplify to variable names.

# Step 5: average of each variable for activity and subject
* summarised_data will is a data frame with 180 rows, corresponding to each possible combination of subjects (1 to 30) and feature (1 to 66). Each cell will represent the mean of the feature for that subject on that activity."activity_label")], FUN=mean)
* Finally, summarised_data.txt is the exported file that has been uploaded to github.
