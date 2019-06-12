# 예제 1-6. 스티브 잡스 연설문 분석하기

install.packages('tm')
library(tm)
library(wordcloud)
library(RColorBrewer)
setwd('D:/Workspace/R_Data_Analysis/Part2/Stage1_WordCloud/EX05_Jobs')
data1 <- readLines("data/tm_test1.txt")
data1
class(data1)

corp1 <- (Corpus(VectorSource(data1)))
corp1
inspect(corp1)
tdm <- TermDocumentMatrix(corp1)
tdm
m <- as.matrix(tdm)
m

stopwords('en')     # 대명사, 전치사 등 불필요한 목록 출력 'en'
stopwords('dutch')
corp2 <- tm_map(corp1, stripWhitespace)
corp2 <- tm_map(corp2, tolower)
corp2 <- tm_map(corp2, removeNumbers)
corp2 <- tm_map(corp2, removePunctuation)
sword2 <- c(stopwords('en'), 'and','but','not')
corp2 <- tm_map(corp2, removeWords, sword2)
corp2


tdm2 <- TermDocumentMatrix(corp2)
tdm2
m2 <- as.matrix(tdm2)
m2
class(m2)
colnames(m2) <- seq(10,40,10)     # matix 컬렴명을 10~40까지 10씩증가, 10,20,30,40으로 지정
m2
freq1 <- sort(rowSums(m2),decreasing = T)     # rowSums 행의 합계
head(freq1,20)
freq2 <- sort(colSums(m2), decreasing = T)    # colSums 열의 합계
head(freq2,20)

findFreqTerms(tdm2,2)     # 특정회수 이상 언급된 것들 출력

palete <- brewer.pal(7,"Set3")
wordcloud(names(freq1), freq=freq1, scale=c(5,1), min.freq = 1, colors=palete, random.order = F,
          random.color=T)
legend(0.3,1,'tm Package Test #1', cex=1,fill=NA,border = NA, bg='white', text.col='red',text.font = 2,
       box.col = 'red')


 # 스티브 잡스 연설문

data1 <- readLines("data/steve.txt")
data1

corp1 <- (Corpus(VectorSource(data1)))
corp1
inspect(corp1)
tdm <- TermDocumentMatrix(corp1)
tdm
m <- as.matrix(tdm)
m

stopwords('en')     # 대명사, 전치사 등 불필요한 목록 출력 'en'
stopwords('dutch')
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

dim(corp4)

colnames(corp4) <- c(1:59)
freq2 <- sort(colSums(corp4),decreasing = T)
freq2

palete <- brewer.pal(7,"Set3")
wordcloud(names(freq1), freq=freq1, scale=c(5,0.5), min.freq = 5, colors=palete, random.order = F,
          random.color=T)
legend(0.3,1,'Steve Jobs', cex=1,fill=NA,border = NA, bg='white', text.col='red',text.font = 2,
       box.col = 'red')
