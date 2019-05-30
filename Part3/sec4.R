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

setwd("d:/Workspace/R_Data_Analysis/Part3/data")      # set설정을 해준 후
txt1 <- read.csv("factor_test.csv")                   # txt1 명령에 read.csv(csv파일 불러오기) -> 괄호안 해당파일 이름
txt1

txt2 <- read.csv("factor_test_utf8.csv")
factor1 <- factor(txt1$blood)
factor1
gender1 <- factor(txt1$sex)
gender1


summary(factor1)


Sys.Date()
Sys.time()
date()
class(Sys.Date())
class(as.Date("2019-05-30"))
as.Date("2019/05/30")
as.Date("01-11-2014")      # 잘못된 날짜 형식(순서변경 등)은 시스템에서 제대로 읽지 못함
as.Date("19-05-30")
as.Date("01-11-2014",format="%d-%m-%Y")        # 년도를 표시하는 Y는 대문자일때 4자리로 표시, 소문자일때 2자리로 표시)
as.Date("19-05-30",format="%y-%m-%d")
as.Date("190530",format="%y%m%d")
as.Date("2014년 11월 1일",format="%Y년 %m월 %d일")       # 한글이 있어도 인식가능
as.Date("01112014",format="%d%m%Y")
as.Date("05-30", format="%m-%d")
as.Date(10, origin="2019-05-30")      # 2019-05-30로 부터 10일 이후 날짜 계산
as.Date(20, origin=date())            # 문자열만 가능 - date()는 문자열이 아니기때문에 오류 발생
as.Date(20, origin=Sys.Date())        # Sys.Date는 날짜열로 인식
as.Date(10, origin="2019-05-30")     # 2019-05-30로 부터 10일 이전 날짜 계산
"2019-05-30" - "2019-05-27"           # 문자열이기 때문에 날짜의 계산이 불가능
as.Date("2019-05-30") - as.Date("2019-05-27")      # as.Date()를 사용해 문자열을 날짜로 변경 후 계산가능
as.Date("2019-05-30") + 5
as.Date("2019-11-14") - Sys.Date()    # 2019-11-14일로부터 남은일 계산 D-day
as.Date("2014-11-01 20:00:00") - as.Date("2014-11-01 18:30")
as.POSIXct("2014-11-01 20:00:00") - as.POSIXct("2014-11-01 18:30:30")
0.491667 * 60
0.50002 * 60

install.packages("lubridate")          # R의 서포트 패키지 중 "lubridate"설치
library(lubridate)                     # library 명령어로 lubridate를 장착 한다는 의미
now()
date <- now()     # now() 현재 날짜를 나타내는 명령어를 date라는 변수로 지정
year(date)        # 현재 년도만 출력
month(date)       
month(date, label = T)
day(date)
wday(date)                # wday는 요일을 나타냄 (목요일 =5, 일요일 = 1)
wday(date, label = T)     # label = ture로 지정하니 한글로 출력
date <- date -days(2); date      # 2일전 날짜 출력하기
month(date) <- 2; date
date+years(1);     #1년 추가하기
date <- now()
date+months(3)
date <- hm("22:30") ; date      # 시간 분 지정하기
date <- hms("22:30:15") ; date  # 시간 분 초 지정하기

