# 예제 3-5, 년도별 기관별 보험청구 금액 현황 분석 후 그래프로 보여주기
install.packages('plotly')
library(plotly)
library(extrafont)
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))
setwd('D:/Workspace/R_Data_Analysis/Part2/Stage3_StructuredData/EX35_보험2')

count <- read.csv('연도별요양기관별보험청구금액_2004_2013_세로.csv')
View(count)

df_long <- melt(count, id=c('년도'),
                variable.name = '기관', value.name= '청구금액')
View(df_long)
df_long$청구금액 <- df_long$청구금액/1000000
options(digits = 2)
View(df_long)

count3 <- ggplot(df_long, aes(x =년도, y =청구금액, fill = 기관, color=기관)) +
  geom_line(linetype =1, size=1) +
  geom_point(size = 3) +
  geom_hline(yintercept=seq(0,8000,1000), lty='dotted', size=0.1)+       # yintercept -> 그래프 y축 0~8000까지 1000단위로 0.1size, 점표선
  theme_classic(base_family="malgun",base_size=10) +
  ggtitle(paste('연도별 요양기관별 보험청구금액 2004~2003','\n','(단위:백만원)')) +
  theme(plot.title = element_text(family="malgun",
                                  face = 'bold',
                                  hjust = 0.5,
                                  size = 15,
                                  color = 'darkblue'))
ggplotly(count3)
