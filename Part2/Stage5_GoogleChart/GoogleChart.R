install.packages('ggmap')
library(googleVis)
library(ggmap)
demo(WorldBank)


# 예제 5-2, 그래프가 살아있다 2
Fruits
Fruits1 <- gvisMotionChart(Fruits, idvar = "Fruit", timevar = "Year")
plot(Fruits1)

# 예제 5-3, 서울 지하철 1,2,3,4호선 이용승객현황 출력

setwd('D:/Workspace/R_Data_Analysis/Part2/Stage5_GoogleChart')
line <- read.csv('1-4호선승하차승객수.csv', header = T, sep = ',')
line
t1 <- gvisMotionChart(line, idvar = '노선번호', timevar= '시간', options=list(width=1000, height=500))
t1
plot(t1)

# 예제 5-5. 서울 지하철 5-8호선 이용승객 현황 표시하기

sub58 <- read.csv("서울지하철_5-8호선_이용현황_시간대별.csv", header = T)
sub58
sub58_2 <- gvisMotionChart(sub58,idvar = "호선명", timevar = "시간")
plot(sub58_2)


# 예제 5-6, googlemap 좋아요 

data(Andrew)
Andrew

strom1 <- gvisMap(Andrew, "LatLong", "Tip",
                  options = list(showTip = TRUE, showLine = TRUE, enableScrollWheel= TRUE,
                                 mapType = 'hybird', useMapTypeControl=TRUE,
                                 width = 800, height = 400))
plot(strom1)

# 예제 5-7, Googlemap-서울시 구청 위치를 표시해줘

loc <- read.csv("서울시구청위치정보_new.csv", header = T)
loc

hoffice <- gvisMap(loc, "LATLON", "name",
                   options = list(showTip=TRUE, showLine=TRUE, enableScrollWheel= TRUE,
                                  mapType = 'normal', useMapTypeControl= TRUE,
                                  width = 1000, height = 400))
plot(hoffice)                   

# 예제 5-9, Google Gauge Chart 로 실적 표시하기
CityPopularity

ex1 <- gvisGauge(CityPopularity, options = list(min = 0, max = 800,
                                                greenFrom = 500,  greenTo = 800,
                                                yellowFrom= 300, yelloTo= 500,
                                                redFrom = 0, redTo=300, width=400, height=300))
plot(ex1)


# 예제 5-10, Google Line Chart 사용하기
fruits = data.frame(month=c("JAN","FEB","mar"),
                    apple = c(30,10,20),
                    orrange= c(20,40,30))
line <- gvisLineChart(fruits)
plot(line)

# Chart 양쪽면에 y축 표시하기
line2 <- gvisLineChart(fruits, "month", c('apple','orrange'),
                       options = list(series = "[{targetAxisindex:0},
                                      {targetAxisindex:1}]",
                                      vAxes= "[{title:'apple'},{title:'orange'}]"))
plot(line2)

