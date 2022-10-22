library(MVN)
# Homework 06

# EX. 01

# get file directory
a = file.path('Lesson_05', 'MV_data.txt')

# use directory to import files
df <- read.table(a)

# get mu and inverse cov matrix
mu <- colMeans(df)
s <- solve(cov(df))

# subtract appropriate means from appropriate x column
df_<-cbind(df$X1-mu[1],df$X2-mu[2],df$X3-mu[3])

# multiply by sqrt of inv cov matrix
normed <- t(s%*%t(df_))

# Ex. 02

normed_ <- t(normed)%*%normed
tested <- normed_ <= qchisq(0.95, 3)
# we can see that all cov (i,j) j=/=i they fall below 0.95 for chi square with
# 3 degrees of freedom

# Ex. 03
mvn(df)

# Ex. 04

# as noted in hw 5, the marginal distributions strongly appear to
# be normal while the multivariate random variable does not appear to be normally distributed
