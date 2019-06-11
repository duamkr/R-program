library(KoNLP)
library(wordcloud)
library(RColorBrewer)
useSejongDic()
library(stringr)
setwd('D:/Workspace/R_Data_Analysis/Part2/Stage1_WordCloud/EX04_work')

# 서울응답소 봄 철(3~5월) 키워드 분석

txt <- readLines('data/응답소_봄.txt')
answer1 <- sapply(txt,extractNoun,USE.NAMES = F)
answer1
head(unlist(answer1),30)
cdata <- unlist(answer1)
answer1 <- str_replace_all(cdata,'[^[:alpha:]]','')
answer1 <- gsub(' ','',answer1)
answer1

txt <- readLines('data/gsub.txt') ;txt
cnt_txt <- length(txt)
cnt_txt
i <- 1
for (i in 1:cnt_txt) {
  answer1 <- gsub((txt[i]),'',answer1)
}
answer1 <- Filter(function(x) {nchar(x) >= 2}, answer1)
answer1 <- Filter(function(x) {nchar(x) <= 10}, answer1)
write(unlist(answer1),'answer_1.txt')
rev <- read.table('answer_1.txt')
nrow(rev)
wordcount <- table(rev)
head(sort(wordcount, decreasing = T),30)

palete <- brewer.pal(9,"Set1")
wordcloud(names(wordcount), freq = wordcount, scale = c(5,1), rot.per = 0.25, min.freq = 2,
          random.order = F, random.color = T, colors=palete)
legend(0.3,1,"봄 철 응답소  키워드 분석", cex = 0.8, fill = NA, border=NA, bg = "white",
       text.col="red", text.font=2, box.col="red")


# 서울응답소 여름철(6~8월) 키워드 분석
txt <- readLines('data/응답소_여름.txt')
answer2 <- sapply(txt,extractNoun,USE.NAMES = F)
head(unlist(answer2),30)
cdata <- unlist(answer2)
answer2 <- str_replace_all(cdata,'[^[:alpha:]]','')
answer2 <- gsub(' ','',answer2)
answer2

txt <- readLines('data/gsub.txt') ;txt
cnt_txt <- length(txt)
cnt_txt
i <- 1
for (i in 1:cnt_txt) {
  answer2 <- gsub((txt[i]),'',answer2)
}
answer2
answer2 <- Filter(function(x) {nchar(x) >= 2}, answer2)
answer2 <- Filter(function(x) {nchar(x) <= 10}, answer2)
write(unlist(answer2),'answer_2.txt')
rev2 <- read.table('answer_2.txt')
nrow(rev2)
wordcount2 <- table(rev2)
head(sort(wordcount2, decreasing = T),30)

palete <- brewer.pal(9,"Set1")
wordcloud(names(wordcount2), freq = wordcount2, scale = c(5,1), rot.per = 0.25, min.freq = 2,
          random.order = F, random.color = T, colors=palete)
legend(0.3,1,"여름철 응답소  키워드 분석", cex = 0.8, fill = NA, border=NA, bg = "white",
       text.col="blue", text.font=2, box.col="blue")


# 서울응답소 가을철(9~11월) 키워드 분석
txt <- readLines('data/응답소_가을.txt')
answer3 <- sapply(txt,extractNoun,USE.NAMES = F)
head(unlist(answer3),30)
cdata <- unlist(answer3)
answer3 <- str_replace_all(cdata,'[^[:alpha:]]','')
answer3 <- gsub(' ','',answer3)
answer3

txt <- readLines('data/gsub.txt') ;txt
cnt_txt <- length(txt)
cnt_txt
i <- 1
for (i in 1:cnt_txt) {
  answer3 <- gsub((txt[i]),'',answer3)
}
answer3
answer3 <- Filter(function(x) {nchar(x) >= 2}, answer3)
answer3 <- Filter(function(x) {nchar(x) <= 10}, answer3)
write(unlist(answer3),'answer_3.txt')
rev3 <- read.table('answer_3.txt')
nrow(rev3)
wordcount3 <- table(rev3)
head(sort(wordcount3, decreasing = T),30)

palete <- brewer.pal(9,"Set1")
wordcloud(names(wordcount3), freq = wordcount3, scale = c(5,1), rot.per = 0.25, min.freq = 2,
          random.order = F, random.color = T, colors=palete)
legend(0.3,1,"가을철 응답소  키워드 분석", cex = 0.8, fill = NA, border=NA, bg = "white",
       text.col="orange", text.font=2, box.col="orange")

# 서울응답소 겨울철(12~2월) 키워드 분석
txt <- readLines('data/응답소_겨울.txt')
answer4 <- sapply(txt,extractNoun,USE.NAMES = F)
head(unlist(answer4),30)
cdata <- unlist(answer4)
answer4 <- str_replace_all(cdata,'[^[:alpha:]]','')
answer4 <- gsub(' ','',answer4)
answer4

txt <- readLines('data/gsub.txt') ;txt
cnt_txt <- length(txt)
cnt_txt
i <- 1
for (i in 1:cnt_txt) {
  answer4 <- gsub((txt[i]),'',answer4)
}
answer4
answer4 <- Filter(function(x) {nchar(x) >= 2}, answer4)
answer4 <- Filter(function(x) {nchar(x) <= 10}, answer4)
write(unlist(answer4),'answer_4.txt')
rev4 <- read.table('answer_4.txt')
nrow(rev4)
wordcount4 <- table(rev4)
head(sort(wordcount4, decreasing = T),30)

palete <- brewer.pal(9,"Set1")
wordcloud(names(wordcount4), freq = wordcount4, scale = c(5,1), rot.per = 0.25, min.freq = 2,
          random.order = F, random.color = T, colors=palete)
legend(0.3,1,"겨울철 응답소  키워드 분석", cex = 0.8, fill = NA, border=NA, bg = "white",
       text.col="gray", text.font=2, box.col="gray")


library(dplyr)
library(ggplot2)
library(scales)
p1 <- read.table('answer_1.txt')
View(p1)
p11 <- p1 %>%
  group_by(V1)%>%
  summarise(count=n())%>%
  mutate(per = (count/sum(count))*100)
  arrange(desc(count))%>%
  head(5)

