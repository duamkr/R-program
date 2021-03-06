library(dplyr)
library(ggplot2)
# 1. 문장을 좀 더 효율적으로 계산하시오

  # 1)
vec1 <- seq(1:6) ; vec1
vec2 <- seq(10,5,-1) ;vec2
vec3 <- rep(1:3,each=2) ;vec3
vec4 <- rep(1:3,2) ; vec4
vec5 <- seq(1,11,2) ; vec5


# 2) 다음과 같이 네명의 학생이 중간 시험과 기말 시험을 봤다. 
  # 2-1) 위 자료를 데이터 프레임으로 만들어 df_score 라는 변수에 할당하시오.
이름 <- c('강경학', '김태균', '이성열', '정은원') ; 이름
중간 <- c(90, 78, 94, 70)
기말 <- c(50, 60, 90, 92)
df_score <- data.frame(이름, 중간, 기말)
df_score

n <- c('강경학', '김태균', '이성열', '정은원') ; 이름
m <- c(90, 78, 94, 70)
h <- c(50, 60, 90, 92)
df_score1 <- data.frame(이름=n, 중간=m, 기말=h)
df_score1





#  2-2) 위 자료에 평균이라는 필드를 추가하고 중간과 기말 시험의 평균을 구해서 평균이라는 필드에 할당하시오
df_score2 <-df_score %>%
  mutate(평균 = (중간 + 기말) / 2)
df_score2


# 3. 2번 문제에 학점이라는 필드를 만들고, 평균 성적에 따라 학점을 부여하시오

df_score2 %>%
  mutate(학점 = ifelse(평균 >= 90, 'A',
                       ifelse(평균 >= 80, 'B',
                                ifelse(평균 >= 70, 'C',
                                         ifelse(평균 >= 60, 'D','F')))))


#4. 양의 정수를 매개변수로 받아 1에서부터 매개변수값까지 홀수를 더해서 그 결과를 리턴하는 함수 ddSum을 작성하고, oddSum(100)의 값을
#   계산하시오. (단, for 반복문을 사용할 것)
oddSum <- function(pos) {
  sum <- 0 
  for (i in seq(1, pos, 2)) {
    sum <- sum + i
  }
  return(100)
}
oddSum(100)

#1~100까지 3의 배수의 합
oddSum <- function(pos) {
  sum <- 0
  for (i in seq(1, pos, 2)) {
    sum <- sum + i
  }
  return(sum)
}


oddSum(50)

#1~100까지 3의 배수의 합

p3<- function(pos) {
  sum <- 0
    for(i in seq(1, pos, 2)) {
    sum <- sum + i
  }
  return(sum)
}
p3(100)

3.675+0.475*1.5

# 5. R 내장 데이터인 "iris":를 이용하여 다음을 구하시오
  # 5-1) "setosa"종 Sepal.Width의 Box Plot을 그려 이상치를 확인할 것
iris


  # 5-2) 이상치를 제거하기 전과 후의 평균과 표준편차


# 6. R 내장 데이터인 "mpg"를 이용하여 다음을 구하시오.

View(mpg)
mpg1 <- mpg
mpg1 %>%
  filter(manufacturer == 'toyota') %>%
  group_by(model) %>%
  summarise(avg = mean((cty + hwy)) / 2) %>%
  arrange(desc(avg))%>%
  head(3)


# 7. R 내장 데이터인 "mpg"를 이용하여 다음의 그래프를 그리시오
  # 7-1) suv 자동차의 시내 연비가 높은 7개 회사와 시내연비
mpg2 <- mpg1 %>%
  group_by(manufacturer) %>%
  filter(class == 'suv') %>%
  summarise(cty_avg = mean(cty)) %>%
  arrange(desc(cty_avg)) %>%
  head(7)

# 7-2) 막대 그래프 형식의 컬러그래프
mpg2
ggplot(mpg2, aes(x = manufacturer, y= cty_avg, fill = manufacturer)) +
  geom_bar(stat ='identity')




# 8. R 내장 데이터인 "diamonds"를 이용하여 다음의 그래프를 그리시오
  # 8-1) clarity 의 돗수를 보여주는 그래프
head(diamonds)
ggplot(diamonds, aes(x = clarity, fill = clarity)) +     # y값을 안주면 카운트해서 y로 축으로 지정됨
  geom_bar()

  # 8-2) clarity 따른 가격의 변화를 보여주는 그래프
d1 <- diamonds %>%
  group_by(clarity) %>%
  summarise(price_mean = mean(price)) 

ggplot(d1, aes(x = clarity, y = price_mean, fill = clarity)) +
  geom_col()



# 9. 실습 데이터중 야구성적.csv 파일을 이용하여 다음의 그래프를 그리시오
  # OPS(출류율 + 장타율)와 연봉대비OPS(OPS / 연봉 * 100)를 구하시오
setwd('D:/Workspace/R_Data_Analysis/Part2/Stage3_StructuredData/EX31_프로야구')

options(digit = 4)
base <- read.csv('야구성적.csv')
base1 <-base %>%
  mutate(ops = 출루율 + 장타율)%>%
  mutate(연봉대비ops = ops / 연봉 * 100) %>%
  mutate(ylabel = paste(sprintf("%4.1f", 연봉대비ops), '%', sep=''))
head(base1)

ggplot(base1, aes(x =선수명, y = 연봉대비ops, fill = 선수명)) +
  geom_bar(stat = 'identity') +
  geom_text(aes(label=ylabel),color = 'black',vjust=-0.3,size=3) +
  ggtitle(paste('연봉대비 OPS분석_선수별')) +
  theme(plot.title=element_text(face="bold", size=10,
                                hjust=0.5, color="black")) 
# geom_hline(yintercept=mean_ops_per_income, color='red', linetype = 'dashed', size=0.5) 


