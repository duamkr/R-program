View(iris)
# sepal , petal - > 산점도

iris1<- iris
iris1
library(dplyr)

setosa_sepal <-subset(iris1, Species == 'setosa') ;setosa_sepal
plot(x = setosa_sepal$Sepal.Length,
     y = setosa_sepal$Sepal.Width)
setosa_petal <-subset(iris1, Species == 'setosa') ;setosa_petal
plot(x = setosa_petal$Petal.Length,
     y = setosa_petal$Petal.Width)

versicolor_sepal <-subset(iris1, Species == 'versicolor') ;versicolor_sepal
plot(x = versicolor_sepal$Sepal.Length,
     y = versicolor_sepal$Sepal.Width)
versicolor_petal <-subset(iris1, Species == 'versicolor') ;versicolor_petal
plot(x = versicolor_petal$Petal.Length,
     y = versicolor_petal$Petal.Width)

virginica_sepal <-subset(iris1, Species == 'virginica') ;virginica_sepal
plot(x = virginica_sepal$Sepal.Length,
     y = virginica_sepal$Sepal.Width)
virginica_petal <-subset(iris1, Species == 'virginica') ;virginica_petal
plot(x = virginica_petal$Petal.Length,
     y = virginica_petal$Petal.Width)



# 품종별 평균치 활용 barplot 비교
p2<-iris1 %>%
  group_by(Species)%>%
  summarise_each(funs(mean),Sepal.Length,Sepal.Width,Petal.Length,Petal.Width)
p2
data.frame(p2,haeder=T)
row.names(p2)<- p2$Species ;p2
p2 <- p2[,2:5]
p2
barplot(as.matrix(p2),main='IRIS Species mean',
        beside=T)
barplot(as.matrix(p2),main='IRIS Species mean')


# Boxplot 12개 그리기
iris1
par(mfrow=c(3,4))

v1 <-subset(iris1, Species == 'setosa') ;v1
v1 <- v1[,1] ; v1
boxplot(v1)

v2 <-subset(iris1, Species == 'setosa') ; v2
v2 <- v2[,2] ; v2
boxplot(v2)

v3 <-subset(iris1, Species == 'setosa') ; v3
v3 <- v3[,3] ; v3
boxplot(v3)

v4 <-subset(iris1, Species == 'setosa') ; v4
v4 <- v4[,4] ; v4
boxplot(v4)

v5 <-subset(iris1, Species == 'versicolor') ; v5
v5 <- v5[,1] ; v5
boxplot(v5)

v6 <-subset(iris1, Species == 'versicolor') ; v6
v6 <- v6[,2] ; v6
boxplot(v6)

v7 <-subset(iris1, Species == 'versicolor') ; v7
v7 <- v7[,3] ; v7
boxplot(v7)

v8 <-subset(iris1, Species == 'versicolor') ; v8
v8 <- v8[,4] ; v8
boxplot(v8)

v9 <-subset(iris1, Species == 'virginica') ; v9
v9 <- v9[,1] ; v9
boxplot(v9)

v10 <-subset(iris1, Species == 'virginica') ; v10
v10 <- v10[,2] ; v10
boxplot(v10)

v11 <-subset(iris1, Species == 'virginica') ; v11
v11 <- v11[,3] ; v11
boxplot(v11)

v12 <-subset(iris1, Species == 'virginica') ; v12
v12 <- v12[,4] ; v12
boxplot(v12)
