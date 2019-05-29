print(5/2)
print(5%/%2)     # 나눗셈의 몫
print(5%%2)      # 나눗셈의 나머지
print(5^2)       # ^ 제곱
10000+10000
100000 + 100000
1 / 1000000
1 / 100000
1 / 1000
'1'+'2'
as.numeric('1') + as.numeric('2')

'first'
"second"
first
first <- 1
first
calss(1)
class(1)      #문자형 데이터 검사
class('1')    #숫자형 데이터 검사

3 & 0
3 & 1
3 | 0
!0
!3

cat(1,NA,2)          # NA 잘못된 값은 그대로 출력
cat(1,NULL,2)        # NULL 빈값은 제외 후 출력
sum(1,NA,2)
sum(1,NULL,2)
sum(1, NA, 2, na.rm = T)
class(NA)
class(NULL)

setwd("d:/Workspace/R_Data_Analysis/Part3/data")      #set설정을 해준 후
txt1 <- read.csv("factor_test.csv")                   # txt1 명령에 read.csv(csv파일 불러오기) -> 괄호안 해당파일 이름
txt1

txt2 <- read.csv("factor_test_utf8.csv")
factor1 <- factor(txt1$blood)
factor1
gender1 <- factor(txt1$sex)
gender1

summary(factor1)
