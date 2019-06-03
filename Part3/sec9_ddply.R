#데이터 정렬

library(googleVis)
sort1 <- Fruits$Sales
sort1
sort(sort1)     # 오름차순 정렬
sort(sort1, decreasing = T)     #내림차순 정렬

#plyr() 패키지

install.packages("plyr")
setwd("D:/Workspace/R_Data_Analysis/Part3/data")
library("plyr")

fruits <- read.csv("fruits_10.csv",header=T)
fruits
ddply(fruits,'name',summarise,sum_qty=sum(qty),sum_price=sum(price))     # summarise = name(Group by)동일한 이름을 가진 컬럼의 qty의 합계의 값을 가진  sum_price컬럼를 생성
ddply(fruits,'name',summarise,max_qty=max(qty),min_price=min(price))     # 

ddply(fruits,'name',transform,sum_qty=sum(qty),
      pct_qty=(100*qty)/sum(qty))              # transform = 행별 연산+출력을 같이 할 때 

#dplyr() 패키지 !!! 매우중요

install.packages("dplyr")
library(dplyr)
setwd("D:/Workspace/R_Data_Analysis/Part3/data")

data1 <- read.csv("2013년_프로야구선수_성적.csv")
data1

data2 <- filter(data1, 경기 > 120) ; data2      # 경기수가 120경기 이상인 선수 필터
data3 <- filter(data1, 경기 > 120 & 득점 > 80) ; data3     # 여러개의 조건 가능
data4 <- filter(data1,포지션%in% c('1루수','3루수')) ; data4     # 포지션이 1루수,3루수 필터
filter(data1, 포지션 == '1루수' | 포지션 == '3루수')             # 포지션이 1루수,3루수 필터(위에꺼랑 같음)
select(data1,선수명,포지션,팀)     # 선수명, 포지션, 팀의 컬럼 선택 출력 
select(data1,순위:타수)      # 순위~타수까지의 컬럼 표시( ~ 연속된)
select(data1,-홈런,-타점,-도루)      # 홈런, 타점, 도루 컬럼만 제외

data1 %>%
  select(선수명, 팀, 경기, 타수) %>%
  filter(타수 > 400)                  # select, filter 명령어 사용

data1 %>%
  select(선수명, 팀, 경기, 타수) %>%
  filter(타수 > 400) %>%
  arrange(타수)                       # select, filter, arrange 명령어 사용

data1 %>%
  select(선수명, 팀, 경기, 타수) %>%
  filter(타수 > 400) %>% 
  arrange(desc(타수))                # select, filter, arrange(내림차순) 명령어 사용

data1 %>%
  select(선수명, 팀, 경기, 타수) %>%
  filter(타수 > 400) %>% 
  arrange(desc(경기),desc(타수))                # select, filter, arrange(내림차순) 명령어 사용

data1 %>%
  select(선수명, 팀, 경기, 타수) %>%
  mutate(경기x타수 = 경기*타수) %>%
  arrange(경기x타수)                            # mutate() = 새로운 컬럼생성(변수값 지정) / 경기x타수 컬럼 생성 = 경기*타수

data2 <- data1 %>%
  select(선수명, 팀, 출루율, 장타율) %>%
  mutate(OPS = 출루율 + 장타율)%>%
  arrange(desc(OPS))                            # mutate() 명령어로 OPS 컬럼 생성
data2
data1 %>%
  group_by(팀) %>%
  summarise(avarage = mean(경기,na.rm=TURE))   # group by로 팀을 지정, summarise는 지정한 그룹 계산

data1 %>%
  group_by(팀) %>%
  summarise_each(funs(mean),경기,타수,타율)    # deprecated - funs / funs()식은 이 프로그램에서 없어질 예정이니, list()를 사용해라

data1 %>%
  group_by(팀) %>%
  summarise_each(list(mean),경기,타수,타율)

data1 %>%
  group_by(팀) %>%
  summarise_each(funs(mean,n()),경기,타수)


# 연습 문제

library(googleVis)
attach(Fruits)                 
library(dplyr)
select(Fruit : Date)
filter(Expenses > 80)

# 1번 문제
Fruits
ex1 <- Fruits
ex1
filter(ex1,Expenses > 80)

# 2번 문제
filter(ex1,Expenses > 90 & Sales > 90)

# 3번 문제 
filter(ex1, Expenses > 90)

# 4번 문제
filter(ex1, Expenses ==79 | Sales ==91)

# 5번 문제
select(ex1, Fruit, Year, Sales)
select(ex1, Fruit:Sales, -Location)

# 6번 문제

group_by(Fruit) %>%
  summarise(average = sum(Sales,rm.na=T)
            
# 7번 문제

?
  
  
            
            