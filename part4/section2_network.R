# 관계도

install.packages("igraph")
library(igraph)
g1 <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))
plot(g1)
str(g1)

name <- c('서진수 대표이사','일지매 부장','김유신 과장','손흥민 대리','노정호 대리'
          ,'이순신 부장','유관순 과장','신사임당 대리','강감찬 부장','광개토 과장','정몽주 대리')

pemp <- c('서진수 대표이사','서진수 대표이사','일지매 부장','김유신 과장','김유신과장',
          '서진수 대표이사','이순신 부장','유관순 과장','서진수 대표이사',
          '강감찬 부장','광개토 과장')
emp <- data.frame(이름=name, 상사이름=pemp) ; emp
str(emp)

g<- graph.data.frame(emp, directed=T)
plot(g,layout=layout.fruchterman.reingold,vertext.size=9, edge.arrow.size=0.5)
str(g)

# png 파일로 저장 / png("파일명","가로크기","세로크기") -> 그래프 실행 -> dev.off()
png("graph/network_3.png", width=600, height=600)
plot(g,layout=layout.fruchterman.reingold,vertext.size=9, edge.arrow.size=0.5)
dev.off()

 # 화살표 삭제 버텍스 라벨 X 
g3 <-  graph.data.frame(emp, directed=F)
plot(g3,layout=layout.fruchterman.reingold,vertext.size=8,
     edge.arrow.size=0.5, vertex.label=NA)

png("graph/network_2.png", width=600, height=600)
plot(g3,layout=layout.fruchterman.reingold,vertext.size=8,
     edge.arrow.size=0.5, vertex.label=NA)
dev.off()


# 관계를 나타내는 그래프 : html저장
install.packages("devtools")
install.packages("d3Network")

# 군집 분석

g <- read.csv("data/군집분석.csv",head=T)
graph1 <- data.frame(학생=g$학생, 교수=g$교수)
g <- graph.data.frame(graph1, directed=T)
plot(g,layout=layout.fruchterman.reingold, vertex.size=2, edge.arrow.size=0.5,
     vertex.color="green",vertex.label=NA)

# 모양 바꾸어서 출력
plot(g,layout=layout.kamada.kawai,vertex.size=2, edge.arrow.size=0.5,
     vertex.label=NA)

V(g)$name
gubun1 <- V(g)$name
gubun1
library(stringr)
gubun <- str_sub(gubun1,start=1, end=1)
gubun

colors <- c()
sizes <- c()
for (i in 1:length(gubun)) {
  if (gubun[i] == 'S') {
    colors <- c(colors,"red")
  } else {
    colors <- c(colors,"green")
  }
}

sizes <-c(
  for(i in 1:length(gubun)) {
    if(gubun[i] == 's') {
      sizes <- c(sizes,2)
      } else {
        sizes <- c(sizes,6)
      }
  }
  
  plot(g,layout=layout.fruchterman.reingold,vertex.size=sizes,edge.arrow.size=0.5,
       vertext.color=colors)

  
library(devtools)
install_github("christophergandrud/d3Network")
library(RCurl)
library(d3Network)
virus1 <- read.csv("data/메르스전염현황.csv", header=T)
d3SimpleNetwork(virus1,width=1200,height=900,file="graph/mers.html")
