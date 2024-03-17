#2.2 Scatter plot matrix
View(mtcars)
cylID <- as.numeric(mtcars$cyl)
cylID

#adjust sequence of the columns, https://www.jianshu.com/p/860081af8230
mtcars2 <- mtcars[,c(1,3:11,2)]
mtx <- as.matrix(mtcars2[,1:10])
pairs(mtx)
pairs(mtx,col=cylID)

mtx2 <- as.matrix(mtcars2[,1:6])
pairs(mtx2,pch=cylID,col=cylID)
pairs(mtx2)

#2.3 Star and segment diagrams
df <- iris[, 1:4]
stars(df)
stars(df, key.loc = c(17, 1))  
stars(df,key.loc=c(20,1.5),draw.segments = TRUE)
View(iris)

#2.4 The ggplot2 package is intuitive and powerful
library(ggplot2)
ggplot(data=iris)+
  aes(x=Petal.Length,y=Petal.Width)+
  geom_point(aes(color=Species,shape=Species))+
  geom_smooth(method = lm)+
  annotate("text",x=5,y=0.5,label="R=0.96")+
  xlab("Petal length(cm)")+
  ylab("Petal width(cm")+
  ggtitle("Correlation between petal length and width")


#Exercise 2.5 Create a scatter plot of sepal length vs sepal width, change colors and shapes with species, and add trend line.
cor(iris$Sepal.Width,iris$Sepal.Length)
library(ggplot2)
ggplot(data=iris)+
  aes(x=Sepal.Length,y=Sepal.Width)+
  geom_point(aes(color=Species, shape=Species))+
  geom_smooth(method = lm)+
  annotate("text",x=5,y=0.5, label="R=-0.12")+
  xlab("Sepal length(cm)")+
  ylab("Sepal width(cm)")+
  ggtitle("Correlation between sepal length and width")


#2.5 Other types of plots with ggplot2
ggplot(data=iris)+
  aes(x=Species, y=Sepal.Length, color=Species)+
  geom_boxplot()+
  geom_jitter(position = position_jitter(0.2))

ggplot(data=iris)+
  aes(x=Petal.Length,fill=Species)+
  geom_density(alpha=0.3)

ggplot(data = iris) +
  aes(x = Petal.Length, fill = Species) +
  geom_density(alpha = 0.3) +
  facet_wrap(~Species, nrow = 3)

ggplot(iris) +
  aes(x = Species, y = Sepal.Width, fill = Species) +
  stat_summary(geom = "bar", fun = "mean") +
  stat_summary(geom = "errorbar", fun.data = "mean_se", width = .3)

#Exercise 2.6 Use boxplot, and density plots to investigate the similarity and differences of petal width of three species in the iris dataset.
ggplot(iris)+
  aes(x=Petal.Width, fill=Species)+
  geom_density(alpha=0.3)
 
ggplot(iris) +
  aes(x = Species, y = Petal.Width, fill = Species) +
  stat_summary(geom = "bar", fun = "mean") +
  stat_summary(geom = "errorbar", fun.data = "mean_se", width = .3)


#2.6 Hierarchical clustering and heat map
ma <- as.matrix(iris[, 1:4]) # convert to matrix
disMatarix <- dist(ma)
plot(hclust(disMatarix))




