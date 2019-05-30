var1 <- "aaa" ; var1
var2 <- 111 ; var2
var3 <- Sys.Date() ; var3
var4 <- c("a","b","c") ; var4
222 -> var5 -> var6      #순서가 바뀌어도 <-, -> 변수에 값을 지정 가능
var5
var6
var8 <- var9 <- 222
var8; var9
string1 <- "Very Easy R Programming" ;string1      # R에서는 변수의 값이 문자열로도 지정가능
string2 <- "I'm James Seo"; string2      # 문자와 문자열을 구분하지 않기 때문에 '," 사용 가능
comp <- c(1,"2")      # comp변수 지정시 1은 num, 2는 char , 2개의 타입을 지정했지만
comp
class(comp)           # 1은 num에서 char로 타입이 자동 변경됨

num1 <- 1
num2 <- 2
num1 + num2
num1 + char1

seq1 <- 1:5
seq1
seq2 <- 'a':'f'      # 문자열은 : 사용 불가 
date1 <- seq(from=as.Date('2014-01-01'),
             to=as.Date('2014-01-31'),by=1)      # 2014-01-01부터 2014-01-31까지 1일씩 추가하기
date1

date2 <- seq(from=as.Date('2019-05-30'),         # 월 단위로 추가하기
             to=as.Date('2020-05-31'),by='month')
date2

date3 <- seq(from=as.Date('2014-05-30'),         # 년 단위로 추가하기
             to=as.Date('2019-05-30'), by='year')
date3

objects()      # 현재 지정된 변수 보기
.hidden <- 3
.hidden
ls()           # 현재 사용되는 변수 
rm(list = ls())      #rm 은 삭제 , ls() list 를 삭제
ls()
