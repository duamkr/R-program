# 데이터 프레임_다른 데이터형을 저장가능

No <- c(1:4)     
Name <- c('Apple','Peach','Banana','Grape')
Price <- c(500,200,100,50)
Qty <- c(5,2,4,7)
sales <- data.frame(NO=No,NAME=Name,PRICE=Price,QTY=Qty)      # No, Name, Price, Qty의 벡터 데이터를 data.frame형태로 생성
sales

sales2 <- matrix(c(1,'Apple',500,5,
                   2,'Peach',200,2,
                   3,'Banana',100,4,
                   4,'Grape',50,70),nrow=4,byrow=T)     # 같은 방식으로 4행의 matrix를 생성하면, 모두 char값의 데이터 형태를 가짐
sales2
df1 <- data.frame(sales2)      # sales2를 data.frame형태로 변경
df1
names(df1) <- c('NO','NAME','PRICE','QTY')      # data.frame으로 변경된 df1에 컬럼명을 부여
df1

sales
sales$NAME     # sales의 NAME컬럼 키값만 출력
sales[1,3]     # 인덱스로 값 출력 
sales[,3]      # PRICE의 키값 출력 (1)
sales$PRICE    # PRICE의 키값 출력 (2)
sales[1,]      # 첫번째 행 출력
sales[c(1,2),] # 첫번째 두번째 행만 출력 (, 콤마의 위치)
sales[,c(1,2)] # 첫번째 두번째 열만 출력 (, 콤마의 위치)

subset(sales, QTY<5)         # QTY컬럼에서 5보다 작은 값
subset(sales, PRICE==500)    # PRICE 컬럽에서 500인 값 , =한개가 아닌 == 2개
subset(sales, PRICE!=500)    # 500이 아닌 값, != 는 ! + = 
subset(sales, NAME=='Grape') # NAME이 Grape 출력


# 각 df1, df2의 같은 컬럼의 data.frame 생성 후 cbind, rbind 데이터프레임 병합
no <- c(1,2,3)
name <- c('apple','banana','peach')
price <- c(100,200,300)
df1 <- data.frame(NO=no, NAME=name, PRICE=price)
df1

no <- c(10,20,30)
name <- c('train','car','airplane')
price <- c(1000,2000,3000)
df2 <- data.frame(NO=no, NAME=name, PRICE=price)
df2

df3 <- cbind(df1,df2)      #df1, df2를 cbind 열 기준으로 붙임
df3

df4 <- rbind(df1,df2)      #df1, df2를 rbind 행 기준으로 붙임(행 이름이 다를 경우 오류)
df4

df5 <- data.frame(name=c('apple','banana','cherry'),price=c(300,200,100))
df5
df6 <- data.frame(name=c('apple','cherry','berry'),qty=c(10,20,30))
df6
merge(df5,df6)             # Inner Join의 개념 = 공통된 값이 있는 것만 합침 (apple, cheery)
merge(df5,df6, all=T)      # Outer Join의 개념 = 공통되지 않아도 모든값을 합침 (apple, cheery, banana, berry)
ribind(df5,df6)            # 이름이 달라서 에러 발생(컬럼명 -> name, price != name, qty)
cbind(df5, df6)
cbind(df6, df5)  


new <- data.frame(name="mango",price=400)
new
df5 <- rbind(df5, new); df5                                     # new의 데이터프레임 생성 후 붙이기
df5 <- rbind(df5, data.frame(name="berry",price=500)); df5      # 바로 데이터 프레임 붙이기(같은 방식이나 코드 간략화)
df5 <- cbind(df5, data.frame(quantity=c(10,20,30,40,50))); df5  # cbind(열추가) 명령어로 quantity의 10,20,30,40,50 값 추가

no <- c(1,2,3,4,5)
name <- c('서진수','주시현','최경우','이동근','윤정웅')
address <- c('서울','대전','포항','경주','경기')
tel <- c(1111,2222,3333,4444,5555)
hobby <- c('독서','미술','놀고먹기','먹고놀기','노는애감시하기')
member <- data.frame(NO=no,NAME=name,
                     ADDRESS=address,TEL=tel,HOBBY=hobby)
member
member2 <- subset(member, select=c(NO,NAME,TEL)) ; member2
member2
member3 <- subset(member, select= -TEL) ; member3
colnames(member3) <-c('번호','이름','주소','취미') ; member3

sales
ncol(sales)      # 열의 개수
nrow(sales)      # 행의 개수
names(sales)     # 열이름 출력
rownames(sales)  # 행이름 출력 
rownames(sales) <- c("one","two","three","four")
sales
sales[c(2,3,1),]      # sales의 모든 행의 순서를 2,3,1의 행순서로 출력
sales[,c(1,2,4,3)]    # sales의 모든 열의 순서를 1,2,4,3의 열순서로 출력


