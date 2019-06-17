# 1.한국복지패널데이터 분석하기

setwd('D:/Workspace/R_Data_Analysis/Part2/Stage4_Map_data/EX04_Welfare')

install.packages('foreign')
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

# 데이터 준비하기
raw_welfare <- read.spss(file = '09-1.Koweps_hpc10_2015_beta1.sav',
                         to.data.frame = T)

#복사본 만들기

welfare <- raw_welfare


# 데이터 검ㄱ토하기
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

# 대규모 데이터 보기 쉽게 변수명을 쉽게 변경

welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)


# 성별에 따른 월급차이
 # 성별 변수 검토 및 전처리
  # 1) 성별 변수 검토하기

class(welfare$sex)
table(welfare$sex)

  # 2) 변수 전처리 결측처리
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)     

   # 결측치 확인
table(is.na(welfare$sex))     #  

   # 성별 항목 이름부여
welfare$sex <- ifelse(welfare$sex == 1, 'male', 'famale')     # ifelse 함수 , sex칼럼의 값이 1이면 'male'입력, 아니면 'famale'입력

table(welfare$sex)
qplot(welfare$sex)


# 2) 월급 변수 검토하기
 # 월급 변수  확인
class(welfare$income)
summary(welfare$income)
qplot(welfare$income) + xlim(0, 1000)      # x축을 1000까지만 

   # 이상치 확인
welfare$income <- ifelse(welfare$income %in% c(0,9999),
                         NA, welfare$income)    # income의 코드가 1~9998이 정상값이기 때문에, 0,9999일 경우는 결측치

   # 결측치 처리
table(is.na(welfare$income))


### 성별 월급 평균표 만들기
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income 
ggplot(sex_income, aes(x = sex, y= mean_income, fill = sex)) +
  geom_col()


# 나이와 월급의 관계
#1) 변수 검토 하기 

class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

# 이상치 확인
welfare$birth <- ifelse(welfare$birth == 9999,
                         NA, welfare$birth)    # income의 코드가 1~9998이 정상값이기 때문에, 0,9999일 경우는 결측치

# 결측치 처리
table(is.na(welfare$birth))

# 파생변수 만들기 - 나이
welfare$age <- 2015 - welfare$birth + 1

qplot(welfare$age)

# 나이에 따른 월급 평균표 만들기
age_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age)%>%
  summarise(mean_income = mean(income))
head(age_income)

welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income)) %>%
  arrange(desc(mean_income)) %>%
  head(5)


summary(age_income)

ggplot(age_income, aes(x = age, y = mean_income)) + 
  geom_line()


# 4. 연령대에 따른 월급차이 
# 어떤 연령대의 월급이 가장 많을까?

welfare <- welfare %>%
  mutate(ageg = ifelse(age < 30, 'young',
                       ifelse(age <= 59, 'middle', 'old')))
table(welfare$ageg)
qplot(welfare$ageg)

# 연령대별 월급 평균표 만들기
ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))

ageg_income

ggplot(ageg_income, aes(x = ageg, y = mean_income, fill = ageg)) + 
  geom_col()  + 
  scale_x_discrete(limits = c("young","middle","old"))


# 어떤 연령대의 월급이 가장 많을까?(10대, 20대, 30대, 40대, 50대, 60대 이상)

welfare <- welfare %>%
  mutate(연령대 = ifelse(age < 20, '10대',
                       ifelse(age < 30, '20대',
                              ifelse(age < 40, '30대',
                                     ifelse(age < 50, '40대',
                                            ifelse(age < 60, '50대','60대'))))))
table(welfare$연령대)
qplot(welfare$연령대)


연령대별_임금 <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(연령대) %>%
  summarise(mean_income = mean(income))

ageg1_income
ggplot(연령대별_임금, aes(x = 연령대, y = mean_income, fill = 연령대)) + 
  geom_col()


# 5. 연령대 및 성별 월급 차이
# 성별 월급차이는 연령대별로 다를까
# 연령대 및 성별 월급 평균표 만들기
sex_income <- welfare%>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))

sex_income

ggplot(sex_income, aes(x = ageg, y = mean_income, fill = sex)) + geom_col() + scale_x_discrete(limits = c("young","middle","old"))

# bar 분리 
ggplot(sex_income, aes(x = ageg, y = mean_income, fill = sex)) + geom_col(position = 'dodge') + scale_x_discrete(limits = c("young","middle","old"))

# 6. 연령 및 성별 월급 평균 비교
sex_age <- welfare%>%
  filter(!is.na(income)) %>%
  group_by(age, sex) %>%
  summarise(mean_income = mean(income))

head(sex_age)

ggplot(sex_age, aes(x = age, y = mean_income, col = sex)) +
  geom_line(size=1)


# 7. 직업별 월급 차이
# 어떤 직업이 월급이 제일 많을까 ?

class(welfare$code_job)
summary(welfare$code_jop)


list_job <- read_excel("09-1.Koweps_Codebook.xlsx", col_names = T, sheet =2)
head(list_job)
dim(list_job)

# welfare의 code_job의 코드를 list_job(엑셀에서 끌어온 코드값)과 join 
welfare <- left_join(welfare, list_job, id = "code_job")      # left_join("대상", "참조대상", id= "조인할 컬럼명")
welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)

# 직업별 평균 월급표

job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))
head(job_income)

# 상위 10개 추출

top10 <- job_income%>%
  arrange(desc(mean_income))%>%
  head(10)
top10

# 그래프 만들기

ggplot(top10, aes(x = reorder(job, mean_income), y= mean_income ,fill= job)) + 
  geom_col() + 
  coord_flip()


# 하위 10개 추출

bottom10 <- job_income%>%
  arrange(desc(mean_income))%>%
  tail(10) 
bottom10

ggplot(bottom10, aes(x = reorder(job, mean_income), y= mean_income ,fill= job)) + 
  geom_col() + 
  coord_flip()


# 8. 성별 직업 빈도
# 성별로 어떤 직업이 가장 많을까?
# 성별 직업 빈도표 만들기
# 남성 직업 빈도 상위 10개 추출
job_male <- welfare %>%
  filter(!is.na(job) & sex == 'male') %>%
  group_by(job) %>%
  summarise(n= n()) %>%
  arrange(desc(n)) %>%
  head(10)
job_male

# 여성 직업 빈도 상위 10개 추출
job_famale <- welfare %>%
  filter(!is.na(job) & sex == 'famale') %>%
  group_by(job) %>%
  summarise(n= n()) %>%
  arrange(desc(n)) %>%
  head(10)
job_famale

# 그래프 그리기
# 남성 직업 상위 10개 직업

ggplot(job_male, aes(x= reorder(job, n), y= n , fill=job)) + geom_col() + coord_flip()

# 여성 직업 상위 10개 직업

ggplot(job_famale, aes(x= reorder(job, n), y= n , fill=job)) + geom_col() + coord_flip()




# 9. 종교 유무에 따른 이혼율
# 종교가 있는 사람들은 이혼을 덜 할까?
# 종교 변수 검토 및 전처리하기
# 1) 변수 검토하기
class(welfare$religion)
table(welfare$religion)


# 2) 전처리

welfare$religion <- ifelse(welfare$religion == 1, 'yes', 'no')


# 혼인 상태 변수 검토하기 및 전처리하기
# 1) 변수 검토하기
class(welfare$religion)
table(welfare$religion)
welfare$group_marriage <- ifelse(welfare$marriage == 1, 'marriage',
                                 ifelse(welfare$marriage == 3, "divorce", NA))

table(welfare$group_marriage)
class(welfare$group_marriage)
qplot(welfare$group_marriage)
religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group=sum(n)) %>%
  mutate(pct = round(n/tot_group*100,1))

religion_marriage

# count 활용
religion_marriage <- welfar %>%
  filter(!is.na(group_marriage)) %>%
  count(religion, group_marriage) %>%
  group_by(religion) %>%
  mutate(pct = round(n/sum(n)*100,1))

# 이혼율 표 만들기
# 이혼 추출
divorce <- religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(religion, pct) %>%
  select(religion, pct) 
divorce


# 그래프 만들기
ggplot(divorce, aes(x= religion, y =pct, fill= religion)) + geom_col()


# 연령대별 이혼율

ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(ageg, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100,1))

ageg_marriage

# 초년 제외 이혼 추출
ageg_divorce <- ageg_marriage %>%
  filter(ageg != 'young' & group_marriage == "divorce") %>%
  select(ageg, pct)
ageg_divorce

# 그래프 만들기
ggplot(ageg_divorce, aes(x= ageg, y= pct, fill= ageg)) + 
  geom_col()


# 연령대, 종교유무, 결혼상태별 비율표 만들기
ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != 'young') %>%
  group_by(ageg, religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group * 100, 1))
ageg_religion_marriage


# 연령대 및 종교 유무별 이혼율 표 만들기

df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(ageg, religion, pct) 
df_divorce

# 연령대 및 종교 유무에 따른 이혼율 그래프
ggplot(df_divorce, aes(x= ageg, y=pct, fill= religion)) + 
  geom_col(position = 'dodge')



# 10. 지역별 연령대 비율
# 노년층이 많은 지역은 어디일까?
# 지역변수 검토 및 전처리
# 1) 변수검토

class(welfare$code_region)
table(welfare$code_region)

list_region <- data.frame(code_region = c(1:7),
                          region = c('서울',
                                     '수도권(인천/경기)',
                                     '부산/경남/울산',
                                     '대구/경북',
                                     '대전/충남',
                                     '강원/충북',
                                     '광주/전남/전북/제주도'))

list_region

# welfare에 지역명 변수 추가하기 
welfare <- left_join(welfare, list_region, id = 'code_region')
welfare %>%
  select(code_region, region)%>%
  head

# 지역별 연령대 비율표 만들기
region_ageg <- welfare %>%
  group_by(region, ageg) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100,1))
head(region_ageg)

ggplot(region_ageg, aes( x = region, y = pct, fill = ageg)) +
  geom_col() + 
  coord_flip()

# 노년층 비율 내림차순 정렬
list_order_old <- region_ageg %>%
  filter(ageg == 'old') %>%
  arrange(desc(pct))
list_order_old


ggplot(region_ageg, aes(x = region, y = pct, fill = ageg)) +
  geom_col() + 
  coord_flip() +
  scale_x_discrete(limits = order)

# 연령대 순으로 막대색깔 나열하기

class(region_ageg$ageg)

# factor로만들어줌

region_ageg$ageg <- factor(region_ageg$ageg, level = c('old', 'middle', 'young'))
class(region_ageg$ageg)
levels(region_ageg$ageg)

ggplot(region_ageg, aes( x = region, y = pct , fill = ageg)) + 
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)













