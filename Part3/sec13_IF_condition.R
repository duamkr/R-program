# 조건식과  조건문 


myAbs <- function(x) {
  if (x >= 0) {
    return(x)
  } else {
    return(-x)
  }
}
myAbs(-3.2)
myAbs(4.5)

myf1 <- function(x) {
  if(x > 0) {
    x <- x*x
    return(x)
    } else {
    x<- x*0
    return(x)
  }
}
myf1(2)
myf1(-1)
myf1(0)

myf2 <- function(x) {
  if(x >0) {
    return(2 * x)
  } else if( x == 0) {
    x <- 0
    return(x)
    } else {
      x<-x*2
      return(x)
  }
}

myf2(3)
myf2(0)
myf2(-3)

no <- scan()
no
ifelse(no%%2 == 0, '짝수', '홀수')


# 연습문제 
 # 1
myf1 <- function(x) {
  if(x > 5) {
    x = 1
    return(x) 
  } else {
    x = 0
    return(x)
  }
}
# return(ifelse(x >5, 1,0))
myf1(6)
myf1(-5)

 # 2
myf2 <- function(x) {
  if(x > 0) {
    x = 1
    return(x)
  } else {
   x = x * 0
   return(x)
  }
}
# return(ifelse(x > 0, 1, 0))

myf2(1)
myf2(-1)

 # 3
myf3 <- function(x,y) {
  if(x > y) {
    x = x - y
    return(x)
  } else {
    x = y - x
    return(x)
  }
}
myf3(3,2)
myf3(2,3)


 # 4
myf4 <- function(x) {
  if(x < 0) {
    x = 0
    return(x) 
  } else if(x <= 5) {
      x = 1
      return(x) }
    else {
      x = 10
      return(x) } 
}

myf4(-1)
myf4(5)
myf4(6)

 # 5 
myf5 <- function(inpu) {
  if(input == 'Y' || input=='y') {
    return('Yes')
  } else {
      return('Not Yes')}
}


myIntD <- function(a,b,c) {
  D = b*b - 4*a*c
  if(D>0) {
    return(2)
  } else if(D = 0) {
    return(1)
  } else {
    return(0) }
}

myRealD <- function(a, b, c) {
  d = b*b 
}