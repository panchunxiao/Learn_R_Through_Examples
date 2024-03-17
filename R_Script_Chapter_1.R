head(iris)
plot(iris)
View(iris)
head(iris)
class(iris)
 str(iris)
summary(iris)
attitude[2:5,1:4]
PL <- iris$Petal.Length
PL
mean(PL)
boxplot(PL)
SL <-iris$Sepal.Length
mean(SL)
View(cars)

#class用来检查data structure
class(mtcars) 
boxplot(mtcars.mpg)
View(mtcars)
boxplot(mtcars$mpg)

x = rnorm(500)
plot(x)
qqnorm(x)
qqline(x)
hist(x)
lag.plot(x)

plot(SL)
lag.plot(SL)
qqnorm(SL)
qqline(SL)
hist(SL)
t.test(PL[1:50],mu=1.5)
t.test(SL[1:50],mu=5)

SW <- iris$Sepal.Width
SW
shapiro.test(SW)
hist(SW)
qqnorm(SW)
qqline(SW)

#1.5 analyzing a categorical variable
counts <- table(iris$Species)
counts
pie(counts)
barplot(counts)

#1.6 The relationship betwen two numerical variables

#以下部分是关于散点图和拟合直线和曲线及其他元素的添加方式
par(mfrow=c(1,1), mai=c(0.7, 0.7, 0.4, 0.4), cex=0.8)
set.seed(1)
x <- rnorm(200)      #产生200个服从正态分布的随机数 
y <- 1+2*x+rnorm(200)
d <- data.frame(x, y)
plot(x, y)   # 绘制散点图
#综合定制示例
plot(x, y, xlab='x=自变量', ylab='y=因变量')  # 添加坐标轴标题
grid(col='grey60')                            # 添加网格线
axis(side=4, col.ticks='blue', lty=1)         # 绘制坐标轴
polygon(d[chull(d),], lty=6, lwd=1, col='lightgreen') # 添加多边形
points(d)                                     # 重新绘制散点图
points(mean(x), mean(y), pch=19, cex=5, col=2)# 添加均值点
abline(v=mean(x), h=mean(y), lty=2, col='gray30') # 添加均值水平线和垂直线
abline(lm(y~x), lwd=2, col=2)                 # 添加回归直线
lines(lowess(y~x, f=1/6), col=4, lwd=2, lty=6)# 添加拟合曲线
segments(-0.8, 0, -1.6, 3.3, lty=6, col='blue')# 添加线段
arrows(0.45, -2.2, -0.8, -0.6, code=2, angle=25, length=0.06, col=2) 
# 添加带箭头的线段
text(-2.2, 3.5, labels=expression('拟合的曲线'), adj=c(-0.1, -0.02),col=4) 
# 添加注释文本
rect(0.4, -1.6, 1.6, -3.5, col='pink', border='grey60') # 添加矩形
mtext(expression(hat(y)==hat(beta)[0]+hat(beta)[1]*x), cex=0.9, side=1,
      line=-5.3, adj=0.72)                    # 添加注释表达式
legend('topleft', legend=c('拟合的直线', '拟合的曲线'), lty=c(1, 6), 
       col=c(2, 4), cex=0.8, fill=c('red', 'blue'), box.col='grey60',
       ncol=1, inset=0.02)                    # 添加图例
title('散点图及拟合直线和曲线\n并为图形添加新的元素', 
      cex.main=0.8, font.main=4)              # 添加标题并换行，使用斜体字
box(col=4, lwd=2)                             # 添加边框 


#网页教学内容的正文从这里开始
PW <- iris$Petal.Width
plot(PW,PL)

SP <- as.factor(iris$Species)
plot(PW,PL,col=SP)
legend("topleft",levels(SP), fill=1:3)
str(SP)
cor(PW, PL)
text(1.5, 1.5, paste("R=0.96"))

model <- lm(PL~PW)
summary(model)
abline(model)
plot(model)


newcyl <-  as.factor(mtcars$cyl) 
plot(mtcars$mpg,mtcars$disp,col=newcyl)
legend("topright",levels(newcyl),fill = 1:3)

?plot

SP <- as.factor(iris$Species)
plot(SW,SL,col=SP)
legend("topleft",levels(SP), fill=1:3)
model2 <- lm(SL~SW)
summary(model2)
abline(lm(SL~SW))
cor(SW,SL)
text(4.0,4.5,paste("R=-0.12"))


plot(model2)

plot(SW[1:50],SL[1:50])
cor(SW[1:50],SL[1:50])


#1.7 Testing the differences between two groups
boxplot(SW~SP)
VersiSW <- iris$Sepal.Width[51:100]
VirgiSW <- iris$Sepal.Width[101:150]
t.test(VersiSW,VirgiSW)


#1.8 Testing the difference among multiple groups (ANOVA)
summary(aov(SW ~ SP))
boxplot(PW~SP)
summary(aov(PW~SP))







