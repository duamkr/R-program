mat1 <- matrix(c(1,2,3,4))      #기본 matrix 1열, 4행
mat1
mat2 <- matrix(c(1,2,3,4),nrow=2)      # nrow = 행 갯수 지정, 열기준으로 출력됨
mat2
mat3 <- matrix(c(1,2,3,4),nrow=2, byrow=T)      #byrow=T 는 가로를 기준으로 출력됨
mat3
mat3[1,1]     # 1열, 1행의 값 출력
mat3[,1]      # []안 첫번째 빈칸 후 ,1 입력 = 1행의 모든 값 출력
mat3[1,]      # []안 두번째 빈칸 후 ,1 입력 = 1열의 모든 값 출력

mat4 <- matrix(seq(1:9),nrow=3,byrow=T)       # 1~9까지 3행, 가로로 입력된 matrix 출력
mat4 <- rbind(mat4, c(10,11,12)) ; mat4       # rbind = 10, 11, 12 마지막 행 추가 (자리수가 다르면 오류발생)
mat4 <- cbind(mat4, c(13,14,15,16)) ; mat4    # cbind = 13, 14, 15, 16의 컬럼 추가

mat5 <- matrix(c('a','b','c','d'),nrow=2,byrow=T) ; mat5
mat5 <- cbind(mat5,c('e','f')); mat5
colnames(mat5) <- c('First','Second','Third')
mat5


#연습 문제

#1번 문제
1)
seasons <- matrix(c('봄','여름','가을','겨울'),nrow=2)
seasons

2)
seasons <- matrix(c('봄','여름','가을','겨울'),nrow=2,byrow=T) 
seasons

#2번 문제
seasons[,1]

#3번 문제
seasons <- rbind(seasons,c('초봄','초가을')); seasons

#4번 문제
seasons <- cbind(seasons,c('초여름','초겨울','한겨울')) ; seasons

colnames(seasons) <- c('세일기간','정가판매','이월상품')
seasons

# Array(배열)_ 3차원 배열 생성

array1 <- array(c(1:12), dim=c(4,3)); array1     #1~12까지의 값을 4x3 배열로 생성
array1 <- array(c(1:12), dim=c(3,4)); array1     #1~12까지의 값을 3x4 배열로 생성
array2 <- array(c(1:12), dim=c(2,2,3)); array1   #1~12까지의 값을 2x2x3 3차원 배열로 생성
array2[1,1,3]
array2[1,,]

# List(각 다른 타입의 데이터를 키,값 형태로 저장가능) Any Data Type
list1 <- list(name='홍길동', anddress='전국', tel='010-2345-6789',
              age='300')
list1
list1$name      # $name 을 key 부분이라 칭함
list1[1:3]      # index를 통해 조회가능
list1[3]
list1$birth <- '1719-10-23'      # list1의 변수에 $birth의 키값을 추가
list1
list1$name <- c('Seojinsu','James Seo')
list1
list1$birth <- NULL      #list1의 birth의 키값에 'NULL'값을 부여, 키값을 
list1

