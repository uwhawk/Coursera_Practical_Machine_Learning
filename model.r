###########################Coursera Practicle Machine Learning Class Projec
###########################Jeff Roberts
###########################Date: 18-Sept. 2014
###########################Data from: http://groupware.les.inf.puc-rio.br/work.jsf?p1=10335
library(plyr)
library(caret)
library(rpart)
library(MASS)
library(glmnet)
library(C50)
library(e1071)
set.seed(13)

###Read training data into a dataframe and assign Factor Levels
train<-read.csv("pml-training.csv")
test<-read.csv("pml-testing.csv")
revalue(train$classe, c("A" = "Sitting-down", "B"="Standing-up", "C"="Stading", "D"="Walking", "E"="Sitting")) -> train$classe


####Change blank value to na, remove columns with na
train[train==""] <- NA
train <- train[, colSums(is.na(train)) == 0]
test[test==""] <- NA
test <- test[, colSums(is.na(test)) == 0]



##########split train into training and test sets
inTrain<-createDataPartition(y=train$classe, p=.75, list=FALSE)
training<-train[inTrain,]
testing<-train[-inTrain,]
training<-training[,-c(1:7)]
testing<-testing[,-c(1:7)]

############################################Fit a model on trees
model1<-train(classe~., data=training, method="rpart")
####insample errors
e1<-(predict(model1, newdata=training)==training$classe)
e1<-as.numeric(sum(e1=="TRUE"))/nrow(training)


###Predict on test dataset
predict1<-predict(model1, newdata=testing)


###Confusion Matrix
cmatrix1<-confusionMatrix(predict1, testing$classe)
c1<-as.matrix(cmatrix1$overall)
r1.1<-c1[1,]
r1.2<-c1[2,]

############################################Fit a model on Linear Discriminant Analysis Model based predictions

model2 = train(classe ~ .,data=training,method="lda")
####insample errors
e2<-(predict(model2, newdata=training)==training$classe)
e2<-as.numeric(sum(e2=="TRUE"))/nrow(training)

###Predict on test dataset
predict2<-predict(model2, newdata=testing)

###Confusion Matrix
cmatrix2<-confusionMatrix(predict2, testing$classe)
c2<-as.matrix(cmatrix2$overall)
r2.1<-c2[1,]
r2.2<-c2[2,]


############################################Fit a model on C5.0 classification trees
model3<-C5.0(classe~.,data=training)
####insample errors
e3<-(predict(model3, newdata=training)==training$classe)
e3<-as.numeric(sum(e3=="TRUE"))/nrow(training)



###Predict on test dataset
predict3<-predict(model3, newdata=testing)



###Confusion Matrix
cmatrix3<-confusionMatrix(predict3, testing$classe)
c3<-as.matrix(cmatrix3$overall)
r3.1<-c3[1,]
r3.2<-c3[2,]



############################################Fit a model on Support Vector
model4<-svm(classe~., data = training)
####insample errors
e4<-(predict(model4, newdata=training)==training$classe)
e4<-as.numeric(sum(e4=="TRUE"))/nrow(training)

###Predict on test dataset
predict4<-predict(model4, newdata=testing)

###Confusion Matrix
cmatrix4<-confusionMatrix(predict4, testing$classe)
c4<-as.matrix(cmatrix4$overall)
r4.1<-c4[1,]
r4.2<-c4[2,]


################Summary Results
###In-Sample Errors
e<-cbind(c(e1, e2, e3, e4))
colnames(e) <- "In-Sample Accuracy"
rownames(e)<- c("Trees", "LDA Model Based", "classification trees", "Support Vector")

###accuracy
a<-cbind(c(r1.1, r2.1, r3.1, r4.1))
colnames(a) <- "Accuracy"
rownames(a)<- c("Trees", "LDA Model Based", "classification trees", "Support Vector")
###kappa
b<-cbind(c(r1.2, r2.2, r3.2, r4.2))
colnames(b) <- "Kappa"
rownames(b)<- c("Trees", "LDA Model Based", "classification trees", "Support Vector")
e;a;b


#########################Predict 20 test casts
predict.t<-predict(model3, newdata=test)
predict.t

##Appendix (Classification Trees Model and Statistics )
summary(model3)

