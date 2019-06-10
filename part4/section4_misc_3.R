install.packages("ggplot2")
library(ggplot2)
install.packages("gridExtra")
library(gridExtra)
# ggplot
korean <-read.table("data/학생별국어성적_new.txt",header=T,sep=",")
korean
ggplot(korean,aes(x=이름,y=점수)) + # 키워드인 data,mapping을 지정안하면 ggplot(데이터,매핑)순서로 지정해야함
  geom_point()
ggplot(data=korean,mapping=aes(x=이름,y=점수)) +   # 키워드를 지정하면 data, mapping 순서를 지키지 않아도 됨
  geom_point()
ggplot(korean,aes(x=이름,y=점수)) + 
  geom_bar(stat="identity")
ggplot(korean,aes(x=이름,y=점수)) + 
  geom_bar(stat="identity",fill="green",colour="red")
ggplot(korean,aes(x=이름,y=점수)) + 
  geom_bar(stat="identity",fill="green",colour="red") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1,
                                 color="blue",size=8))

score_kem <- read.csv("data/학생별과목별성적_국영수_new.csv",header=T)
score_kem
library(dplyr)
sort_kem <- arrange(score_kem,이름,과목)
sort_kem
sort_kem2 <- score_kem%>%
  group_by(이름)%>%
  mutate(누적합계 = cumsum(점수))
sort_kem2

sort_kem3 <- sort_kem2%>%
  group_by(이름)%>%
  mutate(labe=cumsum(점수)-0.5*점수)%>%
sort_kem3


sort_kem4 <- sort_kem %>%
  group_by(이름) %>%
  mutate(누적합계=cumsum(점수), label=cumsum(점수)-0.5*점수)
sort_kem4

ggplot(sort_kem4,aes(x=이름,y=점수,fill=과목)) +
  geom_bar(stat="identity") +
  geom_text(aes(y=label,label=paste(점수,'점')),colour="black",size=4)

gg2 <- ggplot(sort_kem5,aes())    # p515 입력못함


# geom_segment()

score <- read.table("data/학생별전체성적_new.txt",header=T,sep=",")
score
score[,c('이름','영어')]
ggplot(score,aes(x=영어,y=reorder(이름,영어))) +
  geom_point(size=6) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank() ,
        panel.grid.minor.x=element_blank() ,
        panel.grid.major.y=element_line(color="red",linetype="dashed"))
    



# geom_point()
mtcars

str(mtcars)
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point()
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(colour='blue')
ggplot(mtcars, aes(x=hp, y=mpg)) +    # color=factor(am), point의 색은 factor(am)의 값에 따라 다르게표시함
  geom_point(aes(color=factor(am)))
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(color=factor(am), size=5))

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(color=factor(am), size=wt))   # size =wt 값의 크기에 따라 point size 표시

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(shape=factor(am), size=wt))  # point점이 shape으로 변경

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(shape=factor(am), color=wt))

# 종류별로 크기, 모양, 색상 지정
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(shape=factor(am), color=factor(am),size=wt)) +
  scale_color_manual(values=c("red","green"))

 # 선 추가하기
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(color='red') +
  geom_line(color='green')
 # x,y 축 이름바꾸기
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(color='red') +
  geom_line(color='green') +
  labs(x="마력", y= "연비(mile/gallon)")


# geom_line()
three <- read.csv("data/학생별과목별성적_3기_3명.csv",header=T)
three
sort_score <- arrange(three,이름,과목) ; sort_score
ggplot(sort_score,aes(x=과목,y=점수,color=이름,group=이름)) +  geom_line()
 # geom_line + geom_point
ggplot(sort_score,aes(x=과목,y=점수,color=이름,group=이름)) +  
  geom_line() +
  geom_point()
 #  geom_line + geom_point(옵션지정)
ggplot(sort_score,aes(x=과목,y=점수,color=이름,group=이름)) +  
  geom_line() +
  geom_point(size=2.5, shape=22) + 
  ggtitle('학생별과목별성적')

#geom_area
dis <- read.csv("data/1군전염병발병현황_년도별.csv",stringsAsFactors=F)
dis
str(dis)
ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) + geom_line()
ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) + geom_area()
ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) + geom_line() + geom_point()
ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) +
  geom_area(fill="cyan",alpha=0.4) + geom_line(color="red")

# Anscombe's Quartet
 # 기술통계량(평균(x),평균(y), 분산(x), 분산(y), 상관계수, 회귀식)이 동일한 4개의 데이터셋

anscombe
str(anscombe)
ans_x_mean <- anscombe %>%
  select(x1, x2, x3, x4) %>%
  summarise_each(list(mean), x1, x2, x3, x4)
ans_x_mean
ans_y_mean <- anscombe %>%
  select(y1, y2, y3, y4) %>%
  summarise_each(list(mean), y1, y2, y3, y4)
ans_y_mean

ans_x_var <- anscombe %>%
  select(x1, x2, x3, x4) %>%
  summarise_each(list(var), x1, x2, x3, x4)
ans_x_var

ans_y_var <- anscombe %>%
  select(y1, y2, y3, y4) %>%
  summarise_each(list(var), y1, y2, y3, y4)
ans_y_var

p1 <- ggplot(anscombe) +
  geom_point()