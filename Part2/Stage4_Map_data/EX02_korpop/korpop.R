install.packages('stringi')
install.packages('devtools')
devtools::install_github("cardiomoon/kormaps2014")
library(stringi)
library(devtools)
library(kormaps2014)
library(dplyr)
library(ggiraphExtra)
library(mapproj)
library(ggplot2)
str(changeCode(korpop1))
# 컬럼명 변경
korpop1 <- rename(korpop1,
                  pop=총인구_명,
                  name=행정구역별_읍면동)
str(changeCode(korpop1))
head(changeCode(korpop1))
View(korpop1)
# 단계구분도 만들기

ggChoropleth(data = korpop1,          # 지도에 표현할 데이터
             aes(fill=pop,            # 색깔로 표현할 변수
                 map_id = code,       # 지역기준 변수
                 tooltip = name),     # 지도 위에 표시할 지역명
             map = kormap1,           # 지도데이터
             interactive = T)         # 인터랙티브



# 대한민국 시도별 결핵 환자수 단계 구분도 만들기

str(changeCode(tbc))
head(changeCode(tbc))

ggChoropleth(data = tbc,          # 지도에 표현할 데이터
             aes(fill=NewPts,            # 색깔로 표현할 변수
                 map_id = code,       # 지역기준 변수
                 tooltip = name),     # 지도 위에 표시할 지역명
             map = kormap1,           # 지도데이터
             interactive = T)         # 인터랙티브
