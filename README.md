Coursera Practical Machine Learning Project
========================================
Github Repository: https://github.com/uwhawk/Coursera_Practical_Machine_Learning

Submitted by: Jeff Roberts

Date: 19 Sept. 2014
Background

Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. These type of devices are part of the quantified self movement - a group of enthusiasts who take measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. One thing that people regularly do is quantify how much of a particular activity they do, but they rarely quantify how well they do it. In this project, your goal will be to use data from accelerometers on the belt, forearm, arm, and dumbell of 6 participants. They were asked to perform barbell lifts correctly and incorrectly in 5 different ways. More information is available from the website here: http://groupware.les.inf.puc-rio.br/har (see the section on the Weight Lifting Exercise Dataset).

For this project I'll select 4 Machine Learning Models: Trees Model, Linear Discriminant Analysis (LDA) Model, Classification Trees Model and Support Vector Modle. I'll take the Training Dataset, spilit it into a Traning Data Set to build the model using 75% of the data and use the other 25% of the data for a Testing Data Set to Test the Model. I'll use In Sample Accuracy/Error, Out of Sample (Test Set) Accuracy and Kappa Value to ascertain the best model. Finally I'll use the best model to calculate the results for a "Test Case" Dataset which was provided for this Project.

####The R script called model.r that does the following. 

  1- Read training data into a dataframe and assign Factor Levels.
  
  2-Change blank value to na, remove columns with na. 
  
  3-Split train data set into training and test sets
  
  4-Fit a model on Trees Model, Linear Discriminant Analysis (LDA) Model, Classification Trees Model and Support Vector Modle
  
  5-Summary Results: In Sample Error, Out-of-Sample Error/Accuracy and Kappa.
  6-Calculate predicted results using the best model (Classification Trees Model) in this case on the test data set provided.

####Files Inclued are:
model.R-script that performs the 5 steps above and produces the tidy dataset tidy.csv.

README.md-Explanation of the analysis which was performed.



