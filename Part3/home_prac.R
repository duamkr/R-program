setwd("E:/workspace/R/R-program/Part3/data")
getwd()

# 변수에 데이터 담기
aaa1 <- 'aaa'     #'aaa'의 문자열 및 111의 숫자형태의 값도 변수 입력 가능
aaa2 <- 111       # 변수의 값 지정 명령어는 변수 <- 값 이지만, 값 -> 변수도 가능 


# Sequence_연속된 숫자의 값을 나열
seq(1:9)
seq(from='1',to='99',by=1)     # 1-99까지 1값 증가 출력
seq(from=as.Date('2019-05-30') # by=1 지정 1일씩 증가 출력
    ,to=as.Date('2019-06-06'),by=1)
seq(from=as.Date('2019-05-30') # by='month' 지정  1달씩 증가 출력
    ,to=as.Date('2020-06-06'),by='month')
seq(from=as.Date('2019-05-30') # by='year' 지정  1년씩 증가 출력
    ,to=as.Date('2025-06-06'),by='years')
seq(from='1',to=50,by=3)   # 일정 범위 값 3씩 증가 출력

# Objects()_사용자가 지정한 변수를 확인 가능
objects()

# rm()_ 지정한 변수 삭제
rm(aaa1)     # aaa1으로 지정된 변수가 삭제됨
.hidden <- 'abc'     # 변수명 앞에 . 이 붙으면 숨김 변수 , 숨긴변수는 rm()으로 삭제 불가능
ls()


