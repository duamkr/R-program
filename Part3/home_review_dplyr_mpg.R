install.packages("dplyr")
library(dplyr)
mpg
# 1번 문제

p1 <- filter(mpg,displ <= 4) ; p1
p2 <- filter(mpg,displ >= 5) ; p2
mean(p1$hwy) ; mean(p2$hwy)          # 단순하게 mean() 명령어, p1,p2의 hwy의 평균 값 도출

# 2번 문제
p3 <- filter(mpg, manufacturer == 'audi') ;p3
p4 <- filter(mpg, manufacturer == 'toyota') ; p4
mean(p3$cty) ; mean(p4$cty)

# 3번 문제
filter(mpg,manufacturer %in% c('chevrolet','honda','toyota'))%>%
  group_by(manufacturer)%>%
  summarise(cty_average = mean(cty))


# 4번 문제
mpg2 <- select(mpg, 'class','cty',); mpg2

# 5번 문제

filter(mpg2, class %in% c('suv','compact'))%>%
  group_by(class)%>%
  summarise(cty_average = mean(cty))
# 6번 문제
mpg%>%
  filter(manufacturer %in% 'audi')%>%
  arrange(desc(hwy))%>%
  head(5)

# 7번 문제
 # 1)
mpg3 <- mpg ; mpg3

p6 <-mpg3%>%
  mutate(cty_hwy = cty+hwy) ; p6
 # 2)
p7 <- p6%>%
  mutate(cty_hwy_ave = cty_hwy /2) ; p7
 # 3)
p7%>%
  arrange(desc(cty_hwy_ave))%>%
  head(3)

 # 4)
mpg%>%
  mutate(cty_hwy = cty+hwy)%>%
  mutate(cty_hwy_ave = cty_hwy /2)%>%
  arrange(desc(cty_hwy_ave))%>%
  head(3)

# 8번 문제
mpg
mpg%>%
  group_by(manufacturer)%>%
  summarise(cty_ave = mean(cty))

# 9번 문제
mpg%>%
  group_by(manufacturer)%>%
  summarise(cty_ave = mean(cty))%>%
  arrange(desc(cty_ave))


# 10번 문제
mpg%>%
  group_by(manufacturer)%>%
  summarise(hwy_ave = mean(hwy))%>%
  head(3)

# 11번 문제

mpg%>%
  filter(class == 'compact')%>%
  group_by(manufacturer)%>%
  summarise(compact_count = n())%>%
  arrange(desc(compact_count))

m