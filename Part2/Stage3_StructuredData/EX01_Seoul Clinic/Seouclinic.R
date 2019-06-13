setwd('D:/Workspace/R_Data_Analysis/Part2/Stage3_StructuredData/EX01_Seoul Clinic')
library(ggplot2)
library(reshape2)
data1 <- read.csv('2013년_서울_주요구별_병원현황.csv')
View(data1)
barplot(as.matrix(data1[1:9,2:11]),
        main=paste('서울시 주요 구별 과목별 병원현황-2013', '/n',
                   '출처[국민건강보험공단]'),ylab='병원수', beside=T,
        col=rainbow(8), ylim=c(0,350))
abline(h=seq(0,350,10), lty = 3, lwd = 0.2)        
name <- data1$표시과목
name

legend(75,350,name,cex=0.8,fill=rainbow(8),bg='white')
data1[0,]
# ggplot2 
ggplot(data1,x = data1[0,], y = data1[,1:9], fill = 표시과목) +
  geom_bar(width = 0.1, stat = 'identity')

df_long <- melt(data1, id=c('표시과목'),
                variable.name = '지역명', value.name= '의원수')
df_long
ggplot(df_long, aes(x =지역명, y =의원수, fill = 표시과목)) +
  geom_bar(position= 'dodge', stat = 'identity')        # position = dodge 각각의 bar로 표현
