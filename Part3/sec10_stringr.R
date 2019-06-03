#  reshape2()
install.packages("reshape2")
library(reshape2)
fruits

# stringr()

library(stringr)
fruits<- c('apple','Apple','banana','pineapple')      
str_detect(fruits, 'A')     # 위 문장에서 지정된 4개의 이름중 대문자 'A'가 속한 값
str_detect(fruits, 'a')     # 위 문장에서 지정된 4개의 이름중 소문자 'a'가 속한 값
str_detect(fruits, '^a')    # ^=단어의 처음 , $=단어의 끝
str_detect(fruits, 'e$')    # $=단어의 끝
str_detect(fruits, '^[aA]') # 시작이 a,A 로 시작하는 것
str_detect(fruits, '[aA]')  # 단어에 a,A 로 시작하는 것 

str_detect(fruits, regex('a',ignore_case=T))     #ignore = 대소문자 구분안하게 설정
str_count(fruits,'a')     # 단어에서 'a'가 몇개가 나오는지 확인
str_c("apple", "banana")  # apple banana 단어 조합(띄어쓰기 x)
str_c("Fruits:" , fruits) # Fruits 를 fruits로 지정된 단어에 모두 조합
str_c(fruits,"name is ", fruits)
str_c(fruits, collapse="")    #fruits로 지정된 단어를 모두 조합
str_c(fruits, collapse=", ")
str_dup(fruits, 3)     # fruits로 지정된 단어를 지정 횟수만큼 반복 
str_length('apple')    # apple의 문자열 갯수
str_length(fruits)     # fruits로 지정된 문자열 각각의 갯수
str_locate('apple', 'a')      #문자열의 특정문자가 속한 처음,끝의 위치
str_replace('apple', 'p','*')     # 문자열 재 지정 'p'를 '*'로 지정
str_replace('apple', 'p','++')    # 문자열 재 지정
str_replace_all('apple','p','*')  # 문자열 중 바꿀 문자 모두를 변경(_all을 붙임)
fruits <- str_c('apple','/','orange','/','banana')
fruits
str_split(fruits,"/")     # ?

fruits
str_sub(fruits,start=1,end=3)     # fruits에서 1~3번째 까지 출력
str_sub(fruits,start=6,end=9)
str_sub(fruits,start=-5)          # 끝에서 5번째 글짜까지 출력 
str_trim('  apple banana berry   ')     # 문자열의 맨 앞, 맨 뒤 공백 제거
