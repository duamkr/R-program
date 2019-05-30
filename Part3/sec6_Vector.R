c(1,2,3,4,5)
c(1,2,3,4,"5")
vec1 <- c(1,2,3,4,5)
vec1
vec1[3]     # vec1의 변수 값 중 3번째 값을 출력
vec1[-3]    # vec1의 변수 값 중 3번째만 빼고 출력
vec1[1:3]   # vec1의 변수 값 중 1~3번째 값 출력
length(vec1)      # 값의 자리수 (1,2,3,4,5였으니 5자리 수)
vec1[1:(length(vec1)-2)]      # vec1의 값중 vec1 값의 자리수 -2 = 1,2,3
vec1[-1:-3]       # vec1의 변수 값 중 1~3번째 값을 빼고 출력 
vec1[2:4]
vec1[2] <- 6; vec1      # vec1의 2번째값에 6을 추가 (변수 값 수정)
vec1 <- c(vec1, 7); vec1      # vec1에 새로운 값 7 추가
vec1[7] <- 8; vec1
vec1[9] <- 9; vec1      # 8번째 값이 없는 상태에서 9번째 값을 주게되면 건너띄기 때문에 NA로 표시됨
append(vec1,10,after=3)
append(vec1,c(10,11),after=3)
append(vec1,100,after=0)      # 0은 가장 앞자리 라는 특별한 의미
c(1,2,3) + c(4,5,6)     # 동일한 형태의 데이터의 벡터 자체를 연산
c(1,2,3) + 1
var1 <- c(1,2,3)
var2 <- c(4,5,6)
var1+ var2      # 지정된 같은 형태의 변수끼리 연산 가능
var3 <-c('3','4','5') ; var3
var1 + var3     # 타입이 다른 벡터 연산 불가능
union(var1, var3)     # var1과 var2를 unoin , 합집합하여 '3'이 중복이므로 1개만 남기고 1,2,3,4,5가 됨
var4 <- c(1,2,3,4,5 )
var1; var4
var1 + var4
var1 -var2
var2 <- c(3,4,5)
var1 - var2
setdiff(var1, var2)      # var1과 var2의 차집합
setdiff(var2, var1)      # var2와 var1과 차집합
intersect(var1,var2)     # var1과 var2의 교집합

fruits <- c(10,20,30); fruits
names(fruits) <- c('apple', 'banana', 'mango')      # fruits 변수에 이름을 부여함
fruits

var5 <- seq(1:6); var5      # var5 <- c(1,2,3,4,5,6)과 같은함수, 하지만 더 간략함
var6 <- seq(2,-2) ; var6    # 2에서부터 -2까지 출력
even <- seq(2,10,2); even   # 2에서부터 10번째까지 2씩 증가
odd <- seq(1,10,2); odd
var8 <- rep(1:3,2); var8    # rep는 반복식을 의미함, 1~3까지 2번 반복  1 2 3 1 2 3 
var9 <- rep(1:3,each=2) ; var9     # each는 rep로 반복할때 다르게 표현 1 1 2 2 3 3 
5 %in% even      # even변수에 5가 있는지 확인 %in% 

# 연습 문제

#예제1
date4 <- seq(from=as.Date('2015-01-01'),
             to=as.Date('2015-01-31'),by=1)
date4

#예제2
vect1 <- c('사과','배','감','버섯','고구마')
vect1[-3]

#예제3
vec1 <- c('봄','여름','가을','겨울')
vec1
vec2 <- c('봄','여름','늦여름','초가을') ;vec2
vec1; vec2

union(vec1,vec2)
setdiff(vec1,vec2)
intersect(vec1,vec2)

rm(list=ls())
