

# cleandata_assignment
R script to complete programming assignment  for the getting and cleaning data course.

The programme works as follows: 

* Read in the  3 x  test and 3 x train txt files to independent data frames.

* Build 3 new data frames using rbind command.  

* Label the columns in the 3 new data-frames X, y and Subject . 

* Create a new data-frame called "Xnew " built from a subset of "X" where only columns in "X"  with mean or std in the column name are written to "Xnew"

* Create a character vector called activity descriptor which is mapped from data frame y 
   
* Merge data frames subject, activity descriptor and X_new by columns. This completes part 1 of the assignment . resulting data frame is called "dataset 1"

*  Group data_set_1 by subject number into the grouped data frame called  subject-data

*  execute the aggregate command across all colums of subject-data to calculate the average of all variables for each activity and each subject

*  write the result to a file called results.txt