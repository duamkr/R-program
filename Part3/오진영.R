install.packages("ggplot2")
library(ggplot2)
mpg

View(mpg)
data1 <- mpg
data1
# 1번 문제 (정리다시 할 것)
filter(data1, displ < 4)%>%
  arrange(desc(hwy))%>%
  mutate(평균 = mean(hwy))

filter(data1, displ > 5)%>%
  arrange(desc(hwy))%>%
  mutate(평균 = mean(hwy))


# 2번 문제
mpg %>%
  filter(manufacturer %in% c('audi','toyota'))%>%    #이걸 빼먹었음
  group_by(manufacturer)%>%
  summarise(average=mean(cty,na.rm=T))

# 3번 문제  
ex3 <-data1 %>%
  select(manufacturer,hwy)%>%
  filter(manufacturer == 'audi' | manufacturer == 'ford' | manufacturer== 'toyota')%>%
  mutate(hwy_평균 = mean(hwy))
ex3  
View(ex3)


# 4번 문제
ex4 <-select(data1,class,cty)
ex4

# 5번 문제
ex5 <- select(data1,model,class,cty)
ex5%>%
  filter(class =='suv')
list5 <-list(ex5$cty) ; list5


ex5_1 <- select(data1,model,class,cty)
ex5_1 %>%
  filter(class =='compact')
list5_1 <-list(ex5_1$cty) ; list5_1

lapply(c(list5,list5_1),max)


# 6번 문제

mpg %>%
  filter(manufacturer == 'audi')%>%
  arrange(desc(cty))%>%
  head(5)
  
  
# 7번 문제
 # 1)
  mpg2 <-mpg
mpg3 <-mpg2%>%
  mutate(cthwy = cty + hwy) ;mpg3

# 2)
mpg3<-mpg3%>%
  mutate(cthwy_2 = cthwy / 2) ; mpg3

mpg3
 # 3)
mpg3%>%
  arrange(desc(cthwy_2))%>%
  head(3)

 # 4)
mpg%>%
  mutate(cthwy = cty + hwy)%>%
  mutate(cthwy_2 = cthwy / 2)%>%
  arrange(desc(cthwy_2))%>%
  head(3)
  
# 8번 문제
mpg%>%
  group_by(class)%>%
  select(class,cty)%>%
  summarise(average = mean(cty))

# 9번 문제
mpg4<-mpg%>%
  group_by(class)%>%
  select(class,cty)%>%
  summarise(average = mean(cty))
mpg4%>%
  arrange(desc(average))

# 10번 문제
mpg%>% 
  group_by(manufacturer)%>%
  select(class,hwy)%>%
  summarise(averge= mean(hwy))

mpg6  
mpg6%>%
  arrange(desc(averge))%>%
  head(3)


# 11번 문제
mpg%>%
  group_by(manufacturer)%>%
  summarise(avarage = sum(class,na.rm=T))
