setwd('E:/workspace/R/R-program/Part2/Stage1_WordCloud/EX07_work2')
library(rJava)
library(KoNLP)
library(wordcloud)
library(RColorBrewer)
useSejongDic()
library(stringr)
install.packages('tm')
library(tm)
library(ggplot2)
library(dplyr)
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_212')

mergeUserDic(data.frame(readLines('hiphop.txt'), "ncn"))
txt <- readLines('hiphop.txt')
txt
hip <- sapply(txt,extractNoun,USE.NAMES = F)
hip
head(unlist(hip),30)
hdata <- unlist(hip)
hip <- str_replace_all(hdata,"[^[:alpha:]]","")
txt1 <- readLines("gsub.txt")
txt1
cnt_txt <- length(txt1)
i <- 1
for(i in 1:cnt_txt) {
  hip <- gsub((txt1[i]),"",hip)
}
hip <- Filter(function(x) {nchar(x) >= 2}, hip)
hip <- Filter(function(x) {nchar(x) <= 10}, hip)

corp1<- Corpus(VectorSource(hip))
corp2 <- tm_map(corp1, stripWhitespace)
corp2 <- tm_map(corp2, tolower)
corp2 <- tm_map(corp2, removeNumbers)
corp2 <- tm_map(corp2, removePunctuation)
sword2 <- c(stopwords('en'), 'and','but','not')
corp2 <- tm_map(corp2, removeWords, sword2)
corp2

corp3 <- TermDocumentMatrix(corp2,control = list(wordLengths = c(1,Inf)))
corp3
corp4 <- as.matrix(corp3)
corp4

freq1 <- sort(rowSums(corp4),decreasing = T)     # rowSums 행의 합계
head(freq1,20)
freq2 <- sort(colSums(corp4), decreasing = T)    # colSums 열의 합계
head(freq2,20)
freq1
dim(corp4)

palete <- brewer.pal(7,"Set3")
wordcloud(names(freq1), freq=freq1, scale=c(4,0.5), min.freq = 10, colors=palete, random.order = F,
          random.color=T)
legend(0.2,1,'Hip hop word Top10!', cex=1.2,fill=NA, border = NA, bg='white', text.col='red',text.font = 2.5,
       box.col = 'red')


top10 <-head(sort(freq1, decreasing = T),10) ; top10
top11 <- as.data.frame(top10) ; top11
write(unlist(top10),"hip_top10.txt")
rev <- read.table("hip_top10.txt", header=T)
rev
df_hiphop <- as.data.frame(rev)
df_hiphop
ggplot(df_hiphop, aes(x= '', y = top10, fill = word)) +
  geom_bar(width = 1, stat= 'identity') +
  coord_polar("y", start = 0)

options(digits = 2)           # R프로그램 전체 소수점 포함 2자리만 표시
df_hiphop <- df_hiphop %>%
  mutate(pct = top10 / sum(top10) * 100) %>%
  mutate(ylabel = paste(sprintf("%4.1f", pct), '%', sep=''))%>%
  arrange(desc(word))%>%
  mutate(ypos = cumsum(top10) - 0.5 * top10 )
df_hiphop

ggplot(df_hiphop, aes(x= '', y = top10, fill = word)) +
  geom_bar(width = 1, stat= 'identity') +
  geom_text(aes(y=ypos, label=ylabel),color = 'black') +
  coord_polar("y", start = 0) + 
  ggtitle('Hiphop Top 10')

# ggplot bar 차트
ggplot(df_hiphop, aes(x= word, y = top10, fill = word)) +
  geom_bar(width = 0.7, stat = 'identity') +
  geom_text(aes(label=ylabel),color = 'red',vjust=-0.3)


