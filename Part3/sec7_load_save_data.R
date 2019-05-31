# Load and Save

list.files()      #연결된 파일 리스트 출력
list.files(recursive=T)      # 하위 디렉토리까지 다 출력


scan1 <- scan('scan_1.txt')      # scan1 <-변수에 scan_1.txt파일 값을 입력
scan1
scan2 <- scan('scan_2.txt')      # txt안에 1.00 2.00 --- 소수점이지만 실제론 소수점 표시 안함
scan2 <- scan('scan_2.txt',what="") ; scan2      # what="" 을 통해 소수점을 나타내지만 문자열로 표시
scan3 <- scan('scan_3.txt',what="") ; scan3      # what="" 은 문자열엔 무조건 입력
scan4 <- scan('scan_4.txt',what="") ; scan4      # 숫자열, 문자열이 섞인 경우 문자열로 표시
input <- scan()      # scan() 명령어만 실행 후 아래쪽 console창에 직접 입력해 데이터값 입력 가능
input
input <- scan(what="")      # scan() 명령어만 실행 후 아래쪽 console창에 직접 입력해 데이터값 입력 가능(문자열)
input
input <- scan()
input3 <- readline()        # scan() 명령어만 실행 후 아래쪽 console창에 직접 입력해 데이터값 입력 가능(한줄 문장)
input3
input4 <- readline("Are you OK? :")
input4
input5 <- readLines('scan_4.txt')      #readLine()      # 파일을 읽어서 배열 출력 (Line의 L이 대문자)
input5

fruits <- read.table('fruits.txt')      # 일반 텍스트 파일 데이터 프레임으로 불러오기(첫줄이 다르게 표시됨)
fruits
fruits <- read.table('fruits.txt',header=T)       # header=T 명령어로 첫줄 정정 
fruits
fruit2 <- read.table('fruits_2.txt') ; fruit2      # fruits_2.xtx에 주석이 있으나 표시되지 않음
fruit2 <- read.table('fruits_2.txt',skip=2) ; fruit2      #skip=2 맨 위2줄은 생략
fruit2 <- read.table('fruits_2.txt',nrows=2) ; fruit2     #nrows=2 맨 위2줄만 출력
f2top <- read.table('fruits_2.txt',nrows=2)
f2bottom <- read.table('fruits_2.txt',skip=3)
f2top; f2bottom


fruit3<-read.csv('fruits_3.csv')      # csv파일은 header를 자동인식 
fruit3
fruit4<-read.csv('fruits_4.csv')      # csv파일에 header가 없는 경우는 맨윗줄 맨첫번째 값이 문장이면 첫줄을 header로 인식
fruit4<-read.csv('fruits_4.csv',header=F)      # header가 없는 경우 header=F 입력, V1 V2 V3 V4로 임시 생성 
fruit4

label <- c('NO','NAME','PRICE','QTY')
fruit4<-read.csv('fruits_4.csv',header=F,col.names=label)
fruit4


# 원하는 데이터 SQL쿼리로 읽어오기
install.packages("googleVis")
library(googleVis)
install.packages("sqldf")
library(sqldf)
Furits
Fruits

write.csv(Fruits, "Fruits_sql.csv", quote=F, row.names=F)
fruit_2 <- read.csv.sql("Fruits_sql.csv",
                        sql="SELECT * FROM file WHERE Year = 2008")
fruit_2



# 엑셀 데이터 불러오기
install.packages("XLConnect")
library(XLConnect)
data1=loadWorkbook("fruits_6.xls", create=T)
data2=readWorksheet(data1,sheet="sheet1",
                    startRow=1,
                    endRow=8,
                    startCol=1,
                    endCol=5)
data2


fruits6 <- read.delim("clipboard", header=T)      # 엑셀에서 클립보드(ctrl+c) 한 데이터 불러오기
fruits6

# readxls 패키지 사용해 엑셀 불러오기
install.packages("readxl")
library(readxl)
fruits7 <- read_excel("fruits_6.xls",       # 불러올 엑셀파일 이름 
                      sheet = "Sheet1",     # 출력할 sheet 지정
                      range = "A2:D6",      # 범위 지정
                      col_names = TRUE,     # 
                      col_types = "guess",  # 
                      na = "NA")            #
fruits7

