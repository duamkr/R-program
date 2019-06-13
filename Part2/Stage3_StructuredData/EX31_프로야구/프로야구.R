setwd('D:/Workspace/R_Data_Analysis/Part2/Stage3_StructuredData/EX31_프로야구')

library(dplyr)
options(digit = 4)
bb <- read.csv('야구성적.csv')
str(bb)
bb2 <-bb %>%
  mutate(ops = 출루율 + 장타율)%>%
  mutate(연봉대비ops = ops / 연봉 * 100)%>%
  mutate(평균ops = sum(ops) / 25)%>%
  mutate(ylabel = paste(sprintf("%4.1f", 연봉대비ops), '%', sep=''))
bb2
ggplot(bb2, aes(x =선수명, y = 연봉대비출루율, fill = 선수명)) +
  geom_bar(position= 'dodge', stat = 'identity') +
  geom_text(aes(label=ylabel),color = 'black',vjust=-0.3,size=3) +
  ggtitle(paste('야구 선수별 연봉대비 OPS분석','\n','밥값여부')) +
  theme(plot.title=element_text(face="bold", size=10,
                                vjust=2, color="black")) +
  geom_hline(yintercept=mean_ops_per_income, color='red', linetype = 'dashed', size=0.5) 
