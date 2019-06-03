# Sweep

mat1 <- matrix(c(1:6),nrow=2, byrow=T)
a <- rep(1,3)
mat1; a
sweep(mat1,2,a)      # mat1의 각 행을 a요소의 값으로 뺌
b <- matrix(c(2,2))
b
sweep(mat1, 1, b)    # 행 방향으로 sweep

a <- c(1:5); length(a)
length(mat1)
length(Fruits)

log(10)
log10(10)
sin(pi)
abs(-1)      #abs = 절대값
v2 <- c(1,-2,3,-4)
abs(v2)

ceiling(2.3)     # 값보다 한단계 높은 값(정수)
floor(2.3)       # 값보다 한단계 낮은 값(정수)
choose(5,3)

# 함수를 직접 만들어서 사용

myfunc <- function() {
  return(10)
}
myfunc()
myfunc2 <- function(x) {
  y = x * x;
  return(y)
}
myfunc2(-3)


# 연습 문제

#1. 

func_test1 <- function(a,b)  {
  c <- a-b
  return(c)
}
func_test1(3,2)
func_test1(2,3)

#2.
func_test1 <- function(a,b)  {
  c <- a-b
  abs(c)
}
func_test1(2,3)
func_test1(3,2)

func_test2 <- function(a,b) {
  c <- abs(func_test1(a,b))
  return(c)
}
func_test2(2,3)
func_test2(3,2)
