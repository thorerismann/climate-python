# Homework 05

# EX. 01

# get file directory
a = file.path('data','MV_data.txt')

# use directory to import files
df <- read.table(a)

# get dimensions(3 columns, 300 rows)
a  <- dim(df)

# EXERCISE 02

# get the mean for X1,X2,X3
means <- colMeans(df)
x1 <- means[1]
x2 <- means[2]
x3 <- means[3]

# get the standard deviation for X1,X2,X3
std1 <- sqrt(var(df$X1))
std2 <- sqrt(var(df$X2))
std3 <- sqrt(var(df$X3))

# EXERCISE 03

# All univariate X1,X2,X3 look approximately normal.
hist(df$X1, density=10, breaks=20, prob=TRUE,
     xlab="X1", ylim=c(0, 0.11),
     main="Is X1 Normal?")
curve(dnorm(x, mean=x1, sd=std1),
      col="darkred", lwd=3, add=TRUE, yaxt="n")

hist(df$X2, density=10, breaks=10, prob=TRUE,
     xlab="x2", ylim=c(0, 0.15),
     main="Is X2 normal?")
curve(dnorm(x, mean=x2, sd=std2),
      col="darkred", lwd=3, add=TRUE, yaxt="n")

hist(df$X3, density=10, breaks=60, prob=TRUE,
     xlab="x3", ylim=c(0, 0.15),
     main="Is X3 normal?")
curve(dnorm(x, mean=x3, sd=std3),
      col="darkred", lwd=3, add=TRUE, yaxt="n")


# Exercise 4

# part 1 -> I can conclude the marginal distributions are normal.
# part 1 -> that does not translate into a multivariate normal distribution as this requires
# that all linear combinations of X1,X2,X3 are normally distributed. We did not show this.

# make the QQ plots
qqnorm(scale(df$X1))
abline(a = 0, b = 1,col = 'green')


qqnorm(scale(df$X2))
abline(a = 0, b = 1,col = 'red')

qqnorm(scale(df$X3))
abline(a = 0, b = 1,col = 'blue')

#From the QuantPsyc libary I performa Mardias test.
library(QuantPsyc)

mult.norm(df)$mult.test

#Since both p-values are well below 0.05, so according to the
# package creators we can reject the null hypothesis that the multivariate RV is a multivariate normal.

# Exercise 5



