# 정규표현식

char <- c('apple','Apple','AAPLE','banana','grape')
grep('apple',char)     # 백터 특정 패턴 찾아 출력
char2<- c('apple','banana')
grep(char2,char)
grep(paste(char2,collapse = '|'),char1, value=T)

grep('^A', char, value=T)    # a로 시작하는 단어
grep('e$', char, value=T)    # e로 끝나는 단어

char2 <- c('grape1','apple1','apple','orange','Apple')
grep('ap',char2,value=T)        # ap를 포함한 단어
grep('[1-9]',char2,value=T)     # 1-9까지 숫자 포함한 단어
grep('[[:upper:]]', char2, value=T)     # 대문자를 포함하는 단어
grep('[A-Z]',char2,value=T)
nchar(char)     # 글자수 표시
nchar('오진영')
paste('OH','JIN','YEONG')        #연결해줘 paste!
paste('OH','JIN','YEONG', sep='')
paste('OH','JIN','YEONG', sep='/')
paste('OH','JIN','YEONG', sep='-')

substr('abc123',3,3)     # 3~3번쨰 문자 출력
substr('abc123',3,5)     # 3~5번쨰 문자 출력

strsplit('2014/11/22',split='/')     #split 기준으로 글자 분리 
regexpr('-','010-8706-4712')
