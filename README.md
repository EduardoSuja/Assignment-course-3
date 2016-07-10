# Assignment-course-3
---
title: "README.md"
author: "Eduardo Suja"
date: "10 de julio de 2016"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## How the script works.

### Before following the steps, we need lo load the data
* activities, which has no header, and to whom we add the column names "activity_code" and "activity_label")
We obtain a data frame with 6 observations of  2 variables
* features, which has no header, and to whom we add the column names "feature_code" and "feature_label".
We obtain a data frame with 561 observations and 2 variable.

* test data
        - subject_test, with the subject code for each observation
        - test_activities, with activity code for each observation
        - test_set, with all the obervations for the test
        We obtain thre data frames with 2947 observations each one, 1 variable for subject and activities, and 561 variables for the set. It is important to notice that 561 corresponds with the number of observations in features data frame.

* train data
        - same structure as for test
        - We obtain thre data frames with 7352 observations each one, 1 variable for subject and activities, and 561 variables for the set. Again, we  notice that 561 corresponds with the number of observations in features data frame.

To provide the information we are asked for in this asignment, we don`t need to load the inertial folder.
        
### Step 1: merging test and train
Once the data loaded, we can start working on them.

We create test_complete as a column binding of the subject, the activities and the test. We have a data frame with 2947 rows (as expected), and 563 variables (as expected: 1+1+561 = 563).

The same way, we create train_complete as a column binding of the subject, the activities and the train. We have a data frame with 7352 rows (as expected), and 563 variables (as expected: 1+1+561 = 563).

Then we can bind test_complete and train_complete rows.
As in tis asignment we are not asked to provide any information related to the kind of observation (test or train), we have not needed to add a column with "test" in all the rows to test_complete, neither the smae to train. If we had to work later on with these data, it would be a good idea to keep those columns and then be able to filter by kind.
We call the new data frame observations, and with name his columns subject, activity, and the values in the vector features. That is, 1 + 1 + 561 names for 1 + 1 + 561 columns. This new data frame contains
10299 observations (= 2947 + 7352) of  564 variables (= 1 + 1 + 561).

### Step 2: extracting measurements on the mean and standard deviation
We keep only columns with the words "mean" or "std" in tehir names.
According to the instructions, from my point of view the columns with "FreqMean" shouldn't be part of the set. This is a debatable point, but in any case is the criteria I've applied. I hence remove the columns containing the word "Freq".
The result is a data frame with 10299 variables (as before), and 68 variables

### Step 3: descriptive activity names in the data set
To replace the activity_codes by the activity_labels, we merge onservations_mean_std_notFreq and activities, an select the columns we want: the subject, not the activy one, but instead the activity_label, and the 66 other columns containing a mean or a standar deviation, but not a FreqMean.
We get the data frame observations_activities

### Step 4: descriptive variable names
This has been for me the most difficult decision. The names are long and abreviated. If we make them more readable, they will be too long. But they contain many useless characters. So my decision was just to remove non numeric and non alphabetical characters. 

### Step 5: average of each variable for activity and subject
Finally, I just have to  summarise the data to get the means. I used the command aggregate, from the stats library
The result is a data frame of 180 observations, corresponding to each combination of subject (30 subjects) and activities (6 activities), that is 30 x 6 = 180, and 68 variables.

### Final step
We just have to write the data frame created, as "summarised_data.txt", via the command write.table.
