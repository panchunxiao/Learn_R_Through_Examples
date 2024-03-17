library("tidyverse")

CL <- as.factor(Exams$Class)
Eng <- Exams$English
Math <- Exams$Maths
Chn <- Exams$Chinese
Exams %>%
  filter(!is.na(Eng))
Exams %>%
  filter(!is.na(Math))
Exams %>%
  filter(!is.na(Chn))

counts <- table(CL)
counts
summary(Exams)

#boxplot of english scores in each class (simple)
boxplot(Eng~CL)
boxplot(Math~CL)
boxplot(Chn~CL)

#boxplot of english scores in each class (colorful)
ggplot(data=Exams)+
  aes(x=CL, y=Eng, color=CL)+
  geom_boxplot()+
  geom_jitter(position = position_jitter(0.2))

#count the mean of each subject according to class
aggregate(Eng, by=list(type=CL),mean)
aggregate(Math, by=list(type=CL),mean)
aggregate(Chn, by=list(type=CL),mean)


subjects <- c('English','Maths','Chinese')
sapply(Exams[CL==4, subjects], mean)

#explore the correlation between three subjects
cor(Exams[,subjects])
