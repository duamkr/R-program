# function
vec1 <- c(1:5)
vec2 <- c('a','b','c','d','e')
max(vec1)     # 최대값 출력(숫자열은 크기)
max(vec2)     # 최대값 출력(문자열은 마지막)
mean(vec1)    # 평균값 출력
mean(vec2)    # 평균값 출력(문자는 NA)
min(vec1)     # 최소갑 출력
sd(vec1)      # 표준편차 출력
sum(vec1)     # 합계 출력
var(vec1)     # 분산값 출력
library(googleVis)
Fruits

# aggregate(계산된 컬럼~기준된컬럼, 데이터, 함수)
 #연도별 판매 총액
aggregate(Sales~Year, Fruits, sum)      # 연도별 과일의 총 판매량 계산
aggregate(Sales~Year, Fruits, max)      # 연도별 과일 판매량의 제일 큰 값
aggregate(Sales~Year, Fruits, mean)     # 연도별 과일 판매량의 평균
 #품목별 판매
aggregate(Sales~Fruit, Fruits, sum )    # 품목별 과일의 총 판매량 계산
aggregate(Sales~Fruit+Year, Fruits, sum)     # 추가조건으로 +" "  항목을 추가 가능

# apply(대상, 적용함수)
mat1 <- matrix(c(1:6),nrow=2, byrow=T)
mat1
apply(mat1, 1, sum)     # 1 - 행 단위 합계 
apply(mat1, 1, prod)    # 1 - 행 단위 곱 
apply(mat1, 2, sum)     # 1 - 열 단위 합계 
apply(mat1[,c(2,3)],1,sum)     # mat1의 행은 전체, 열은 2,3의 합

list1 <- list(Fruits$Sales); list1
list2 <- list(Fruits$Profit); list2
lapply(c(list1, list2), max)      #list1,list2에서 max값 -> list형태 출력
sapply(c(list1,list2),max)        #list1,list2에서 max값 -> vector형태 출력
lapply(Fruits[,c(4,5)],max)       #행은 전체, 열은 4,5번 열의 max값 -> list형태 출력
sapply(Fruits[,c(4,5)],max)       #행은 전체, 열은 4,5번 열의 max값 -> vector형태 출력

# tapply(출력값, 기준컬럼, 적용함수) / mapply(함수, 벡터1,벡터2,벡터3.....) 함수 사용
Fruits
tapply(Sales,Fruit,sum)      # err발생 , Fruit을 찾을 수 없음
attach(Fruits)               # tapply() 함수는 attach로 작업대상을 지정 해줘야 함
tapply(Sales,Fruit,sum)      # 지정 후 출력 확인
tapply(Sales,Year,sum)

vec1 <- c(1:5)
vec2 <- seq(10,50,10)       # 10~50까지 10단위 
vec3 <- seq(100,500,100)    # 100~500까지 100단위
mapply(sum, vec1, vec2, vec3)


#연습문제

#1. read.csv(data1.csv)
data1 <-read.csv('data1.csv')
data1
sapply(data1[,c(2:15)],sum)     # 년도별 합계 (내가푼거)
apply(data1[,c(2:15)],2, sum)   # 년도별 합계 (교수님)
apply(data1[,c(2:15)],1, sum)   # 연령별 합계 (내가푼거)
apply(data1[,-1],1,sum)         # 연령별 합계 (교수님)+

#2. 
data2 <-read.csv('1-4호선승하차승객수.csv')
data2
attach(data2)
tapply(승차,노선번호,sum)                   # 노선 번호별 승차인원수 합계
tapply(하차,노선번호,sum)                   # 노선 번호별 하차인원수 합계
sapply(data2[,c(3,4)],sum)                  # 노선 번호 상관없이 승차 하차 인원수 합계
aggregate(승차+하차~노선번호,data2,sum)     # 노선 번호별 승하차 인원수 합계
aggregate(승차~노선번호,data2,sum)          # 노선 번호별 승차 인원수 합계
aggregate(하차~노선번호,data2,sum)          # 노선 번호별 하차 인원수 합계


