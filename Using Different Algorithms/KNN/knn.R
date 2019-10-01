library(class)

traindata <- read.csv(file="https://humanactivity.000webhostapp.com/Train_final.csv", header=TRUE, sep=",")
train_label<- traindata$RESULT
train_data<-traindata[-7]
train_data

test1<-read.csv(file="https://humanactivity.000webhostapp.com/input.csv",header=TRUE, sep=",")
test1

test1<-test1[,1:6]
test1


test_pred<-knn(train = train_data, test =test1, cl=train_label,k =5,prob=TRUE)


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

