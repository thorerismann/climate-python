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

# break down the 3x3 matrix into the matrices minors. Then apply the 2x2 determinant formula and
# you are left with a series of simple multiplication and sums.
# written in dollarsign (R latex) math, we have the following:
# $$det(A) = 4\begin{bmatrix} 6 & 8 \\ -3 & 2 \end{bmatrix} - 7\begin{bmatrix} -1 & 3 \\ 8 & 2 \end{bmatrix} +3\begin{bmatrix} -1 & 6 \\ 3 & -3 \end{bmatrix}$$
# $$det(A) = 4*[6*2-8*(-3)]-7[(-1)*2-3*8]+3[(-1)*(-3)-6*3]$$
v1 <- c(4,7,3)
v2 <- c(-1,6,8)
v3 <- c(3,-3,2)
a <- det(t(cbind(v1,v2,v3)))

#exercise 3

# make the matrices
v1 <- c(2,8,5,1)
v2 <- c(7,3,6,8)
v3 <- c(9,0,5,6)
a <- t(cbind(v1,v2,v3))
v1 <- c(4,2,1,6)
v2 <- c(6,7,4,0)
v3 <- c(6,8,0,1)
b <- t(cbind(v1,v2,v3))
# add the matrices
c = a+b

# check out transpose properties
d = t(a+b)
e = t(a) + t(b)
# d = e if we look at the elements of the matrix we see that the element-wise operators are preserved in the transpose by definition of transpose.

# check out matrix multiplication / inner product /  dot product / not sure what the preferred term
# in this course is.
f = a%*%t(b)
g = t(a)%*%(b)
# they are both square matrices, with shape [4,4] and [3,3]
# they are not the same (obviously)
# the 'inner product' [3,3] matrix is also symmetric

# exercise 4

# calculating the long way given below, although it is *always* faster to
# use the built in functions (there is a R trace function)
mytrace = 0
newfunc <- function(mymatrix){for(i in 1:ncol(mymatrix)) {
  mytrace = mytrace + mymatrix[i,i]
}
return(mytrace)
}
# caluclate tr(c) = tr(A dot B_transpose)
newfunc(a%*%t(b))

# calculate traces from given matrices
v1 <- c(2,3)
v2 <- c(8,6)
a <- t(cbind(v1,v2))
v1 <- c(4,6)
v2 <- c(5,4)
b <- t(cbind(v1,v2))

newfunc(a)
newfunc(b)
newfunc(a+b)

# trace of a sum is equal to the sum of the traces
# here, newfunc(A) = newfunc(B) 
# but no matter what matrix A and B newfunc(A+B) = newfunc(A) + newfunc(B)
# this is one of the basic properties of the trace of a matrix.