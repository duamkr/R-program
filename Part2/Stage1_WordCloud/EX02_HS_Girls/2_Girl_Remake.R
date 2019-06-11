# 예제 1-2, 여고생은 어디를 가장 고치고 싶을까요?
setwd('D:/Workspace/R_Data_Analysis/Part2/Stage1_WordCloud/EX02_HS_Girls')
library(KoNLP)
library(wordcloud)
library(RColorBrewer)
useSejongDic()

data1 <-readLines("data/remake.txt")
data1
data2 <- sapply(data1,extractNoun,USE.NAMES=F)     # 명사추출
data2
data3 <- unlist(data2)    # data type list 해제
data3 <- Filter(function(x) {nchar(x) <= 10}, data3) # 글자의 수가 10개 이하인 단어만 data3에 필터링
data3
head(unlist(data3),30)
data3 <- gsub('\\d+','',data3)
data3 <- gsub('\\d+','',data3)      #  숫자 없애기
data3 <- gsub('쌍수','쌍꺼풀',data3)
data3 <- gsub('쌍커풀','쌍꺼풀',data3)
data3 <- gsub('메부리코','매부리코',data3)
data3 <- gsub('\\.','',data3)
data3 <- gsub(' ','',data3)
data3 <- gsub("\\'",'',data3)
data3 <- gsub("('",'',data3)
data3 <- gsub("^'",'',data3)
data3

write(unlist(data3),"remark_2.txt")
data4<-read.table("remark_2.txt")
data4
nrow(data4)
wordcount<- table(data4)
wordcount

head(sort(wordcount, decreasing=T),20)
txt <- readLines('data/성형gsub.txt')
txt
cnt_txt <- length(txt)
cnt_txt
i <-1
for( i in 1:cnt_txt) {
  data3 <- gsub((txt[i]),"",data3)
}
data3
data3 <- Filter(function(x) {nchar(x) >= 2}, data3)
write(unlist(data3),'remake_2.txt')
data4 <- read.table('remake_2.txt')
data4
nrow(data4)
wordcount <- data4
wordcount
head(sort(wordcount, decreasing=T),30)

palete <- brewer.pal(9,'Set3')
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per = 0.25, min.freq = 2,
          random.order = F, random.color = T, colors=palete)

