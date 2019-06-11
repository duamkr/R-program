# Part2_ Stage1
 # 서울시 예제
setwd('D:/Workspace/R_Data_Analysis/Part2/Stage1_WordCloud/EX01_Seoul')
install.packages('rJava')
library(rJava)
install.packages('KoNLP')
install.packages('wordcloud')
library(KoNLP)
library(wordcloud)
useSejongDic()
library(RColorBrewer)


data1 <- readLines('data/seoul_new.txt')
data1
#문장을 단어로 만들어 명사만 추출('서울시','버스','정책','역행','행위','고발')
extractNoun('서울시 버스정책을 역행하는 행위를 고발합니다')  

data2 <- sapply(data1, extractNoun, USE.NAMES=F)     # sapply(여러건의 데이터를 한번에 저장) 
data2     # 명사들만 추출한 데이터(data type -> list형태 )
head(unlist(data2, 30))     # list형태의 data type을 해제
data3 <- unlist(data2)
data3     # list형태가 아닌 명사 데이터만 나열된 형태

# gsub('변경전글자','변경후글자','원데이터')를 통해 불필요한 키워드는 제거(공백으로 변경해줌)
data3 <- gsub('\\d+','',data3)     # 모든 숫자없애기
data3 <- gsub('서울시','',data3)
data3 <- gsub('서울','',data3)
data3 <- gsub('요청','',data3)
data3 <- gsub('제안','',data3)
data3 <- gsub(' ','',data3)
data3 <- gsub('-','',data3)
data3

# 파일로 저장 후 테이블 형태로 변환하여 불러오기

write(unlist(data3),'seoul_2.txt')
data4 <- read.table('seoul_2.txt')
data4
nrow(data4)     # 변수의 데이터건 확인
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing=T), 20)
data3 <- gsub('OO','',data3)
data3 <- gsub('개선','',data3)
data3 <- gsub('문제','',data3)
data3 <- gsub('관리','',data3)
data3 <- gsub('민원','',data3)
data3 <- gsub('이용','',data3)
data3 <- gsub('관련','',data3)
data3 <- gsub('시장','',data3)
data3 <- gsub('님','',data3)
data3 <- gsub('한','',data3)
data3 <- gsub('동','',data3)
data3 <- gsub('적','',data3)
write(unlist(data3),'seoul_3.txt')
data4 <- read.table('seoul_3.txt')
wordcount <- table(data4)
head(sort(wordcount,decreasing=T),20)

palete <- brewer.pal(9,'Set3')
wordcloud(names(wordcount), freq=wordcount, scale=c(5,1), rot.per=0.25, min.freq=1,
          random.order=F,random.color = T, colors=palete)
legend(0.3,1,'서울시 응답소 요청사항 분석', cex=0.8, fill=NA, border=NA, bg='white',
       text.col='red', text.font=2, box.col='red')


v3 <- c('봄이 지나면 여름이고 여름이 지나면 가을입니다.','그리고 겨울이죠.')
ㅍ3
v3
extractNoun(v3)
v4 <- sapply(v3, extractNoun,USE.NAMES=F)
v4
wordcloud(c(letters,LETTERS,0:9),seq(1,1000,len=62))
library(RColorBrewer)
palete <- brewer.pal(9,"Set1")
wordcloud(c(letters,LETTERS,0:9),seq(1,1000,len=62),colors=palete)
