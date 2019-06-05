# SQL DF

install.packages("sqldf")
library(sqldf)
library(googleVis)
Fruits
sqldf('select * from Fruits')
sqldf("select * from Fruits where Fruit = 'Apples'")     # " " 안에 ' ' 존재, 구분 필요
sqldf('select * from Fruits where Fruit = \'Apples\'')   # ' ' 를 중복으로 사용시 \ <- 로 변수값 지정시 지정 필요
sqldf('select * from Fruits limit 3')     # 데이터 3줄 표시
sqldf('select * from Fruits limit 0,3')   # limit 3과 같음 
sqldf('select * from Fruits limit 3, 5')     # 3, 5 로 지정하면 3번째부터 뒤 5개를 출력
sqldf('select * from Fruits order by year')  # 날짜순 정렬
sqldf('select * from Fruits order by year desc')

# 과일별로 판매액의 합계
sqldf('select Fruit, sum(Sales) from Fruits group by Fruit')     # 과일별 판매량 합계 (where절 없음)
sqldf('select Fruit, sum(Sales), sum(Expenses), sum(Profit) from Fruits group by Fruit')   # 과일별 합계(group by)
sqldf('select Year, avg(Sales), avg(Expenses), avg(Profit) from Fruits group by Year')     # 년도별 평균(group by)
sqldf('select Year, avg(Sales), avg(Expenses), avg(Profit) from Fruits group by Year order by avg(Profit) desc')
sqldf('select max(Sales) from Fruits')
sqldf('select min(Sales) from Fruits')
sqldf('select max(Sales),min(Sales) from Fruits')

# Sub Query
sqldf('select * from Fruits where sales =(  
      select min(Sales) from Fruits)')             # where절의 조건값을 Sub Query로 지정 가능
sqldf('select * from Fruits where sales =(
      select max(Sales) from Fruits)')

sqldf('select * from Fruits where sales In(  
      select max(Sales), min(Sales) from Fruits)') 

# UPDATE 사용
sqldf(c('UPDATE Fruits SET Profit=50 WHERE Fruit = \'apples\' AND Year=2008',
      'select * from Fruits'))
Fruits

# join 
song <- read.csv("song.csv", header = F, fileEncoding = 'utf8')
song
names(song) <- c('_id','title','lyrics','girl_group_id')

girlgroup <- read.csv("girl_group.csv", header = F, fileEncoding = 'utf8')




