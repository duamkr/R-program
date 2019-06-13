# 예제 3-4, 년도별 기관별 보험청구 건수 분석 후 그래프로 보여주기

setwd('D:/Workspace/R_Data_Analysis/Part2/Stage3_StructuredData/EX34_보험')

count <- read.csv('연도별요양기관별보험청구건수_2001_2013_세로.csv',stringsAsFactors = FALSE)
count
colname <- count$년도

v1 <- count[,2]/10000
v2 <- count[,3]/10000
v3 <- count[,4]/10000
v4 <- count[,5]/10000
v5 <- count[,6]/10000
v6 <- count[,7]/10000
v7 <- count[,8]/10000
v8 <- count[,9]/10000
v9 <- count[,10]/10000
v10 <- count[,11]/10000

plot(v1, xlab='', ylim=c(0,6000), axes = FALSE,col='violet',type='o', lwd=2,
     main=paste('연도별 요양 기관별 보험청구 건수 (단위:십만건)','\n','출처:건강보험심사평가원'))
     
axis(1, at=1:10, label = colname, las=2)    # x축 라벨
axis(2,las=1)     # y축 라벨

lines(v2, col = 'blue', type = 'o', lwd = 2)
lines(v3, col = 'red', type = 'o', lwd = 2)
lines(v4, col = 'black', type = 'o', lwd = 2)
lines(v5, col = 'orange', type = 'o', lwd = 2)
lines(v6, col = 'green', type = 'o', lwd = 2)
lines(v7, col = 'cyan', type = 'o', lwd = 2)
lines(v8, col = 'yellow', type = 'o', lwd = 2)
lines(v9, col = 'brown', type = 'o', lwd = 2)
lines(v10, col = 'pink', type = 'o', lwd = 2)
abline(h=seq(0,6000,500), v= seq(1,100,1),lty=3,lwd=0.2)     # 그래프 점선 표시
col <- names(count[1,2:10])
colors <- c('violet','blue','red','black','orange','green','cyan','yellow','brown','pink')
legend(1,6000,col,cex=0.8,col=colors,lty=1,lwd=2,bg='white')
