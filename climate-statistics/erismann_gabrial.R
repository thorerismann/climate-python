
# exercise 1
a <-c(2,3,4)
b <-c(-1,3,0)

# exercise 2

# t(a) = the transpose of a column vector is a row vector
# t(t(a)) = the transpoce of a row vector is a column vector

# but this isn't really the case as R treats a one dimensional vector as only
# having a length.

# exercise 3
c <- a + b
d <- a*b

# a*b and t(a)*b are basically the same, both shouldn't function but they 
# do because the values happen to line up and so R does a pairwise multiplication
# a%*%b is the dot product ("matrix multiplication")

# Exercise 4
e <- a[0:1] + b[1:2]

#exercise 5

f <-function(some_variable){
  return (sqrt(some_variable^2 +2))
}

x <- c(-2,0,7)
answer <- f(x)
answer <- f(a)

# exercise 6
#boolean values can be interested as 0/1 so the squares of True = 1 = 1^2 = 1 and
# False = 0 = 0^2 