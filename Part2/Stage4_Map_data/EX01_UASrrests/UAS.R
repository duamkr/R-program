

install.packages('ggiraphExtra')
install.packages('maps')
install.packages('mapproj')
install.packages('stringi')
library(mapproj)
library(ggiraphExtra)
library(ggplot2)
library(dplyr)
library(reshape2)
library(stringr)
library(stringi)
library(extrafont)
library(tibble)    # 
str(USArrests)
head(USArrests)
tail(USArrests)
summary(USArrests)
crime <- rownames_to_column(USArrests, var = "state")     #  주명이 로우네임으로 되어 있는 걸 stats 컬럼 생성 후 옴겨줌 
crime$state <- tolower(crime$state)     # 첫글자가 대문자로 되어 있는 주 이름을 소문자로 변경
crime



#미국의 주 지도 데이터 준비하기 
states_map <- map_data("state")
str(states_map)

# 단계 구분도 만들기
ggChoropleth(data=crime,
             aes(fill=Murder,
                 map_id = state),
             map = states_map) 
  

#인터랙트비 단계구분도 만들기( interactive = T , 타이틀, x,y 명 달수없다?)
ggChoropleth(data=crime,
             aes(fill=Murder,
                 map_id = state),
             map = states_map) +
  ggtitle("미국 주별 살인범죄 분포") +
          xlab("경도") +
          ylab("위도") +
            theme(plot.title = element_text(face = 'bold', hjust = 0.5, 
                                            size = 15, color= 'dark red'),
                  plot.subtitle = element_text(hjust=1.0))
ggChoropleth(data=crime,
             aes(fill=Rape,
                 map_id = state),
             map = states_map,
             interactive = T)

ggChoropleth(data=crime,
             aes(fill=Assault,
                 map_id = state),
             map = states_map,
             interactive = T)
ggChoropleth(data=crime,
             aes(fill=UrbanPop,
                 map_id = state),
             map = states_map,
             interactive = T)




