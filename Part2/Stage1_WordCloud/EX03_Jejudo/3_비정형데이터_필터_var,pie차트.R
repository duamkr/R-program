# 예제 2-1. "제주도여행코스 추천" 검색어 결과를 그래프로 표시하기  
setwd('D:/Workspace/R_Data_Analysis/Part2/Stage1_WordCloud/EX03_Jejudo')
library(KoNLP)
library(wordcloud)
library(RColorBrewer)
useSejongDic()
library(stringr)
library(ggplot2)
library(dplyr)
install.packages('extrafont')
library(extrafont)
windowsFonts()
windowsFonts(malgun = '맑은 고딕')


mergeUserDic(data.frame(readLines('data/제주도여행지.txt'), "ncn"))
txt <- readLines("jeju.txt")
txt
place <- sapply(txt,extractNoun,USE.NAMES = F)
place
head(unlist(place),30)
cdata <- unlist(place)
place <- str_replace_all(cdata,"[^[:alpha:]]","")
place
place <- gsub(" ","",place)
txt <- readLines("data/제주도여행코스gsub.txt")
txt
cnt_txt <- length(txt)
i <- 1
for(i in 1:cnt_txt) {
  place <- gsub((txt[i]),"",place)
}
place
place <- Filter(function(x) {nchar(x) >= 2}, place)
write(unlist(place),"jeju_2.txt")
rev <- read.table("jeju_2.txt")
nrow(rev)
wordcount <- table(rev)
head(sort(wordcount, decreasing=T),30)

top10 <-head(sort(wordcount, decreasing = T),10); top10
palete = brewer.pal(10,'Spectral')  # 'Spetral 컬러셋의 10개의 색을 표현
pie(top10, main = '제주도 추천 여행코스 TOP 10')     # top10 변수값을 파이로 표현
pie(top10, col = palete, radius=1, 
    main = '제주도 추천 여행코스 TOP 10')     # 색의 표현은 palete로 지정된 값을 불러옴
pie(top10, col = palete, radius=1, 
    main = '제주도 추천 여행코스 TOP 10')     # top10 변수값을 파이로 표현 색 추가

pct <- round(top10/sum(top10) * 100, 1)
pct
names(top10)
lab <- paste(names(top10), "\n", pct, '%')
# lab <- paste(names(top10), "\n", pct, '%', sep='') 빈칸이 삭제됨
lab
pie(top10, col = palete, radius=1, 
    main = '제주도 추천 여행코스 TOP 10', label = lab)


# ggplot pie chart 그리기
top10
df_top10 <- as.data.frame(top10)
df_top10
ggplot(df_top10, aes(x= '', y = Freq, fill = rev)) +
  geom_bar(width = 1, stat= 'identity') +
  coord_polar("y", start = 0)     #coord_polar <- y값을 0부터 시작해 원으로 표현

options(digits = 2)           # R프로그램 전체 소수점 포함 2자리만 표시
df_top10 <- df_top10 %>%
  mutate(pct = Freq / sum(Freq) * 100) %>%
  mutate(ylabel = paste(sprintf("%4.1f", pct), '%', sep='')) %>%
  arrange(desc(rev)) %>%     # Freq 높은순으로 지정되 있던 걸 rev순, 즉 역순으로 재 배열
  mutate(ypos = cumsum(pct) - 0.5*pct)
df_top10

ggplot(df_top10, aes(x= '', y = Freq, fill = rev)) +
  geom_bar(width = 1, stat= 'identity') +
  geom_text(aes(y=ypos, label=ylabel),color = 'black') # geom_text -> bar 그래프에 라벨 표시

ggplot(df_top10, aes(x= '', y = Freq, fill = rev)) +
  geom_bar(width = 1, stat= 'identity') +
  geom_text(aes(y=ypos, label=ylabel),color = 'black') +
  coord_polar("y", start = 0) + 
  ggtitle('제주도 추천 여행코스 TOP 10')

bchart <- head(sort(wordcount,decreasing = T),10)
bchart
bp <- barplot(bchart, main = '제주도 추천 여행 코스 TOP 10', col = palete,
              cex.names=0.7, las = 2, ylim = c(0,25))
pct <- round(bchart/sum(bchart)*100,1)              
pct              
text(x = bp, y= bchart * 1.05, labels = paste("(",pct,"%",")"), col = 'black', cex = 0.7)
text(x = bp, y= bchart * 0.95, labels = paste(bchart,'건'), col = 'black', cex = 0.7)

barplot(bchart, main = '제주도 추천 여행 코스 TOP 10', col = palete,
        xilm=c(0,25),cex.name=0.7, las=1, horiz = T)
text(y = bp, x= bchart * 0.9, labels = paste(bchart,'건'), col = 'black', cex = 0.7)
text(y = bp, x= bchart * 1.15, labels = paste("(",pct,"%",")"), col = 'black', cex = 0.7)

# 3d pie
install.packages('plotrix')
library(plotrix)
th_pct <- round(bchart / sum(bchart) * 100 ,1)
th_names <- names(bchart)
th_labels <- paste(th_names,'\n','(',th_pct,')')

pie3D(bchart, main= '제주도 추천 여행 코스 top 10', col = palete, cex = 0.3, labels = th_labels,
      explode = 0.05)

