library(class)
library(randomForest)

traindata <- read.csv(file="https://humanactivity.000webhostapp.com/Train_final.csv", header=TRUE, sep=",")
train_label<- traindata$RESULT
train_data<-traindata[-7]
train_data

X<-train_data
Y<-train_label

model1 <- randomForest(Y ~ ., data = X, importance = TRUE)
model1

test1<-read.csv(file="https://humanactivity.000webhostapp.com/input.csv",header=TRUE, sep=",")
test1

test1<-test1[,1:6]
test1

test_pred <- predict(model1,X,type = "class")
test_pred


a<-table(test_pred)
a
max=-1
flag=0

if(a[names(a)=="LAYING"]>max){
  max=a[names(a)=="LAYING"]
  result="LAYING"
  flag=1  
}
if(a[names(a)=="SITTING"]>max){
  max=a[names(a)=="SITTING"]
  result="SITTING"
  flag=2
}
if(a[names(a)=="STANDING"]>max)
{
  max=a[names(a)=="STANDING"]
  result="STANDING"
  flag=3
}

if(a[names(a)=="WALKING"]>max){
  max=a[names(a)=="WALKING"]
  result="WALKING"
  flag=4
}  

result

