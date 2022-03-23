# Importing the dataset
dataset=read.csv('self dataset.csv')

#Displaying the count of null values per column
colSums(is.na(dataset))

# Missing data
#na. rm = TRUE to exclude missing values
dataset$Sleep.Hour[is.na(dataset$Sleep.Hour)]<-mean(dataset$Sleep.Hour, na.rm=TRUE)
dataset$StudyDS.Hour[is.na(dataset$StudyDS.Hour)]<-mean(dataset$StudyDS.Hour, na.rm=TRUE)
dataset$Exercise.Hour[is.na(dataset$Exercise.Hour)]<-mean(dataset$Exercise.Hour, na.rm=TRUE)
dataset$Work.Hour[is.na(dataset$Work.Hour)]<-mean(dataset$Work.Hour, na.rm=TRUE)
dataset$Study.Hour[is.na(dataset$Study.Hour)]<-mean(dataset$Study.Hour, na.rm=TRUE)
dataset$Feeling[is.na(dataset$Feeling)]<-mean(dataset$Feeling, na.rm=TRUE)
colSums(is.na(dataset))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library('caTools')
set.seed(123)
split=sample.split(dataset$Feeling,SplitRatio=.8)
training_set=subset(dataset,split==TRUE)
testing_set=subset(dataset,split==FALSE)
# Fitting Multiple Linear Regression to the Training set
regressor<-lm(formula=Feeling~.,data=training_set)
summary(regressor)

case1<-data.frame(Sleep.Hour=6,Exercise.Hour=.25,Study.Hour=2,StudyDS.Hour=0,Work.Hour=5)
predict(regressor,case1)
case2<-data.frame(Sleep.Hour=6,Exercise.Hour=.25,Study.Hour=2,StudyDS.Hour=0,Work.Hour=5)
predict(regressor,case2)
case3<-data.frame(Sleep.Hour=6,Exercise.Hour=.25,Study.Hour=2,StudyDS.Hour=0,Work.Hour=5)
predict(regressor,case3)
case4<-data.frame(Sleep.Hour=6,Exercise.Hour=.25,Study.Hour=2,StudyDS.Hour=0,Work.Hour=5)
predict(regressor,case4)
case5<-data.frame(Sleep.Hour=6,Exercise.Hour=.25,Study.Hour=2,StudyDS.Hour=0,Work.Hour=5)
predict(regressor,case5)