setwd("D:/Workspace/R_Data_Analysis/part4")

var1 <- 1:5
plot(var1)
var1 <- 5:1
plot(var1)
var2 <- c(2,2,2)
plot(var2)
x <- 1:3
y <- 4:2
plot(x,y)
plot(x, y, xlim=c(0,5),ylim=c(0,5),
     xlab="X축 값", ylab="Y축 값", main="Plot Test")

# 조금 더 멋진 그래프
v1 <- c(100,130,120,160,150)     
plot(v1,type='o',col='red',ylim=c(0,200),axes=FALSE,ann=FALSE)

axis(1,at=1:5, lab=c("MON","TUE","WED","THU","FRI"))     # x축 설정
axis(2,ylim=c(0,200))                                    # y축 설정

title(main="FRUIT", col.main="red",font.main=4)
title(xlab="DAY",col.lab="black")
title(ylab="FRICE",col.lab= "blue")

# 그래프 배치 조정(mfrow)
v1 <- c(100,130,120,160,150)     
par(mfrow = c(1,3))      # par(mfrow = c(nr,nc)) , nr :행의갯수 nc: 열의갯수 
plot(v1,type="o")
plot(v1,type="s")
plot(v1,type="l")

v1 <- c(100,130,120,160,150)     
par(mfrow = c(1,3))
pie(v1)
plot(v1,type="o")
barplot(v1)

par(mfrow = c(1,1))
a <- c(1,2,3)
plot(a,xlab="aaa")

par(mgp=c(0,1,0 )) # mgp=c(제목위치, 지표값위치, 지표선위치))
plot(a,xlab="aaa")

par(mgp=c(3,1,0))
plot(a,xlab="aaa")

par(mgp=c(3,2,1))
plot(a,xlab="aaa")

par(oma=c(2,1,0,0)) #oma 그래프 전체의 여백 조정
plot(a,xlab="aaa")

par(oma=c(0,2,0,0))
plot(a,xlab="aaa")


v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)
v3 <- c(3,4,5,6,7)
plot(v1,type="s", col="red", ylim=c(1,10))
par(new=T)
plot(v2,type="o", col="blue",ylim=c(1,10))
par(new=T)
plot(v3,type="l", col="green",ylim=c(1,10))

legend(4,9,c("v1","v2","v3"), cex=0.9, col=c("red","blue","green"),lty=1)     #범례

x <- 1:5
barplot(x)
barplot(x, horiz=T)      # horiz= T 막대그래프를 가로로 표시 

x <- matrix(c(5,4,3,2),2,2) ; x      # 2,2나 nrow =2 나 같음
x <- matrix(c(5,4,3,2),nrow=2) ; x
barplot(x)
barplot(x, beside=T)      # beside = T , 값마다 표시(beside지정안할 경우 한줄로 표시됨)
barplot(x, beside=T,names=c(5,3), col=c("green","yellow"))
barplot(x, beside=T,names=c(5,3), col=c("green","yellow"),horiz = T)
par(oma=c(1,0.5,1,0.5))     # 하, 좌, 상, 우 여백 지정

barplot(x, names=c(5,3), col=c("green","yellow"),horiz = T)
barplot(x, names=c(5,3), col=c("green","yellow"),horiz = T, xlim = c(0,10))     # X 축 0~10값까지 표시


v1 <- c(100,120,140,160,180)
v2 <- c(120,130,150,140,170)
v3 <- c(140,170,120,110,160)

qty <- data.frame(BANANA=v1, CHERRY=v2,ORANGE=v3)
qty

barplot(as.matrix(qty),main="Fruit's Sales QTY",              # as.matrix는 matrix 형태가 아닌 것을 matrix형태로 변형
        beside=T, col=rainbow(nrow(qty)), ylim=c(0,400))
legend(14,400,c("MON","TUE","WED","THU","FRI"), cex=0.8, fill=rainbow(nrow(qty)))
barplot(t(qty), main="Fruits Sales QTY", ylim=c(0,900),
        col=rainbow(length(qty)), space=0.1, cex.axis=0.8, las=1, names.arg=c("MON","TUE","WED","THU","FRI"),cex=0.8)
legend(0.2, 800, names(qty), cex=0.7, fill=rainbow(length(qty)))


# 조건 주고 그래프 그리기
peach <- c(180,200,250,198,170)
color <- c()
for(i in 1:length(peach))  {
  if (peach[i] >= 200)
    color <- c(colors,"red") 
  else if (peach[i] >= 180)
    color <- c(colors, "yellow")
  else
    color <- c(colors, "green")
}

barplot(peach, main="Peach Sales QTY",
        names.arg = c("MON","TUE","WED","THU","FRI"),col=colors)

#히스토그램 
height <- c(182,175,167,172,163,178,181,166,159,155)
par(mfrow=c(1,2))
barplot(height)
hist(height,main="histogram of height")

# 파이(pie)그래프

par(mfrow=c(1,1), oma = c(0.5,0.5,0.1,0.1))
p1 <- c(10,20,30,40)
pie(p1, radius=1)

 #시작 각도 90도 지정
pie(p1,radius=1, init.angle=90)

    
    
pct <- round(p1/sum(p1) * 100,1)
lab <- paste(pct,"%")
pie(p1,radius=1, init.angle=90, col=rainbow(length(p1)),
    label=lab)
legend(1,1.1,c("Week 1","Week 2","Week 3","Week 4"),
       cex=0.5, fill=rainbow(length(p1)))

# 범례 생략 그래프 바로 출력
pct <- round(p1/sum(p1) * 100,1)
lab1 <- c("Week 1","Week 2","Week 3","Week 4")
lab2 <- paste(lab1,"\n",pct,"%")
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),label=lab2)

# 3D pie / pie3D()함수
install.packages('plotrix')
library(plotrix)
p1 <- c(10,20,30,40,50)
f_day <- round(p1/sum(p1)*100,1)
f_label <- paste(f_day,"%")
pie3D(p1,main="3D Pie Chart", col=rainbow(length(p1)),
      cex=0.5,labels=f_label,explode=0.05)
legend(0.5,1,c("MON","TUE","WED","THU","FRI"),cex=0.6,
       fill=rainbow(length(p1)))


# boxplot : 상자차트

v1 <- c(10,12,15,11,20)
v2 <- c(5,7,15,8,9)
v3 <- c(11,20,15,18,13)
boxplot(v1,v2,v3)
boxplot(v1,v2,v3,col = c("blue","yellow","pink"),
        names = c("Blue","yellow","pink"),
        horizontal=T)
