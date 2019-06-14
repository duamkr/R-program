# 반복문 while
number <- 0
while(number < 5 ) {
  print(number)
  number <- number + 1
}

while(number < 5 ) {
  print(number)
  if(number == 3) {
    break
  }
  number <- number + 1
  }

number <- -1
while (number <= 10) {
  number <- number + 1
  if(number %% 2 == 1)
    next
  print(number)
}

# 반복문 for
for(i in 1:10) {
  print(i)
}

#1~100까지 합계를 구하는 값(외워둘것)
sum <- 0
for (i in 1:100) {
  sum <- sum + i
}
print(sum)


#1~100까지 3의 배수의 합
sum <- 0
for(i in 1:100) {
  if(i %% 3 = 0)
  sum <- sum + i
}
print(sum)


#각 넘버의 배수들의 합
multiple <- function(limit, number) {
  sum <- 0
  for( i in 1:limit) {
    if( i %% number == 0)
      sum <- sum+i
  }
  return(sum)
}
multiple(1000,4)     

# 특정변수의 값이 10이상 = color-> "red", 6-9 color -> yellow, 그 이하 값 "green"
colors <- c()
for (i in 1:length(my_ray4)) {
  if(my_ray4[i] >=10) {
    colors <- c(colors,"red") } 
  else if(my_ray4[i] >=6) {
    colors <- c(colors,"yellow") }
  else {
    colors <- c(colors,"green") }
  }

library(stringr)
for (i in 5:1){
  line <- ''
for(k in 1:i) {
  line <- str_c(line, '#')
}
  print(line)
}

# 구구단 구하는 for roop
for (i in 1:9) {
  for (j in 1:9) {
    print (i*j)
  }
}

# 다이아몬드 모양..

x <- c("   #   ","  ###  "," ##### ","#######"," ##### ","  ###  ","   #   ")
for(i in x) {
 
}


# 약수 구하기
getDenominator <- function(x) {
  den <-c(1)
  if(x>= 2) {
    for(i in 2:x) {
      if(x %% i == 0)
        den <- c(den, i)
    }
  }
  return(den)
}

# for loop 에서 반복 구간 증가값 설정

seq(1,5,2)     # 1~5 사이 값 2씩 증가


sum <- 0                # 3~100까지 3증가분의 합
  for(i in seq(3,100,3)) {
    sum <- sum + i
  }
print(sum)








  







