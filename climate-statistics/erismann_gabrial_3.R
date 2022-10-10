# Homework 3

#exercise 1

v1 <- c(-2,1,7,4,6)
v2 <- c(1,-10,-6,-5,13)
v3 <- c(7,-6,-16,8,5)
v4 <- c(4,-5,8,0,7)
v5 <- c(6,13,5,7,10)
a <- t(cbind(v1,v2,v3,v4,v5))

# exercise 2

# a is symmetric as a = t(a)
b <- a == t(a)
# a is nonsingular as rank(a) = ncol(a)
b <- rankMatrix(a)[1] == ncol(a)
# rank a is 5 so it has full rank as noted above.
rankMatrix(a)[1]
# not positive definite by inspecting eigen values we see not all >0
eigen(a)[1]
# not orthogonal as A dot transpose(A) is not equal to 1 ( Tranpose(A) = inverse(A))
orthog <- a%*%(t(a)) == diag(nrow=5)

#exercise 3

d <- eigen(a)$values
c <- eigen(a)$vectors

# C * transpose(C)= I 
# eigenvectors of unique eigenvalues are orthogonal and there are 5 unique eigenvalues corresponding to the fact the matrix is full rank.
# since we have an orthogonal matrix, the tranpose(C) = inverse(C) which is defined by the above equation
check_ortho <- round(c %*%tr(c)) == I

# exercise 4

# compute inverse using eigendecomposition
e = 1/d
a_inv <- c%*%diag(e)%*%t(c)
# check the answer
round(a%*%a_inv)

# no it does not have a well define square root as not all eigenvalues >= 0.