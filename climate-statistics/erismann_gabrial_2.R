# Homework 2

#exercise 1

# $A^T * B = M_{3,7}$ and $B^T * A = M_{7,3}$
# $A * C^T = M_{10,4}$ and $C*A^T = M_{4,10}$ 
# $A * e = M_{10,1}$ and $e^T*A^T = M_{1,10}$
# $A^T * f = M_{7,1}$ and $f^T*A = M_{1,7}$
# $B * d = M_{10,1}$ and $d^T*B^T = M_{1,10}$
# $B^T * f = M_{3,1}$ and $f^T*B = M_{1,3}$
# $e^T * C^T = M_{1,4}$ and $C*e = M_{4,1}$
# $d * e^T = M_{3,7}$ and $e*d^T = M_{7,3}$
# $d * f^T = M_{3,10}$ and $f*d^T = M_{10,3}$
# $f * e^T = M_{10,7}$ and $e*f^T = M_{7,§0}$

#exercise 2

# $$det(A) = 4\begin{bmatrix} 6 & 8 \\ -3 & 2 \end{bmatrix} - 7\begin{bmatrix} -1 & 3 \\ 8 & 2 \end{bmatrix} +3\begin{bmatrix} -1 & 6 \\ 3 & -3 \end{bmatrix}$$
# $$det(A) = 4*[6*2-8*(-3)]-7[(-1)*2-3*8]+3[(-1)*(-3)-6*3]
# then use the usual 2x2 rule on the minor axes of the matrix to calculate the determinant as usual.
v1 <- c(4,7,3)
v2 <- c(-1,6,8)
v3 <- c(3,-3,2)
a <- det(t(cbind(v1,v2,v3)))

#exercise 3

v1 <- c(2,8,5,1)
v2 <- c(7,3,6,8)
v3 <- c(9,0,5,6)
a <- t(cbind(v1,v2,v3))
v1 <- c(4,2,1,6)
v2 <- c(6,7,4,0)
v3 <- c(6,8,0,1)
b <- t(cbind(v1,v2,v3))
c = a+b
d = t(a+b)
e = t(a) + t(b)
# c = d = e if we look at the elements of the matrix we see that the element-wise operators are preserved in the transpose.
f = a%*%t(b)
g = t(a)%*%(b)
# they are both square matrices
# the 'inner product' is also symmetric

# exercise 4

mytrace = 0
newfunc <- function(mymatrix){for(i in 1:ncol(mymatrix)) {
  mytrace = mytrace + mymatrix[i,i]
}
return(mytrace)
}
newfunc(a%3%t(b))

v1 <- c(2,3)
v2 <- c(8,6)
a <- t(cbind(v1,v2))
v1 <- c(4,6)
v2 <- c(5,4)
b <- t(cbind(v1,v2))
newfunc(a)
newfunc(b)
newfunc(a+b)

# newfunc(a) = newfunc(b) 
# newfunc(a+b) = newfunc(a) + newfunc(b)
# this is one of the basic properties of the trace of a matrix.