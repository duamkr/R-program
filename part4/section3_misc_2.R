var1 <- 1:5
plot(var1)
segments(2,2,3,3)
arrows(5,5,4,4)
text(2,4,"lable")
text(3,2,"테스트",srt=45)     # 3,2에 해당되는 테스트라는 문자를 45도 각도로 기울여 출력

plot(1:15)
abline(h=8)
rect(1,6,3,8)
arrows(1,1,5,5)
text(8,9,"뚜껑열리는시점")
title("더 이상 나를 화나게 하지마!","까불지마 정도")
