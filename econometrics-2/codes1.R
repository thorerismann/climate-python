#Change the directory here:
setwd("C:\\Users\\melly\\Dropbox\\teaching\\2022-2\\Econometrics 2\\Data")

#Import Stata data 
library(haven)
#You can import the data directly from the internet:
morg20 <- read_dta("https://data.nber.org/morg/annual/morg20.dta")
#Remark: it is probably better to save it on your hard drive and load it from there:
#morg20 <- read_dta("morg20.dta")

#Preparation of the data
#Variable sex
morg20$sex <- factor(morg20$sex, labels = c("male", "female"))
#Variable wage
morg20$wage = morg20$earnwke / morg20$uhourse
#Replace NaN with NA
morg20$wage[is.nan(morg20$wage) | is.infinite(morg20$wage)] <- NA
#Variable education, recode in years of education
library(car)
morg20$education <-  NA
morg20$education <-
  recode(
    morg20$grade92,
    "31=0; 32=2.5; 33=5.5; 34=7.5; 35=9; 36=10; 37=11; 38:39=12; 40=13; 41:42=14; 43=16; 44:46=18"
  )
#We keep 5 variables, only complete observations, and only individuals who worked more than 10 hours per week
my.data <-
  na.omit(morg20[morg20$uhourse >= 10, c("wage", "sex", "age", "education")])
#We keep only people between 25 and 65 years old.
my.data <- my.data[my.data$age>=25 & my.data$age<=65,]
#Education: we merge the lowest 4 categories (for a shorter table)
my.data$n.education <- my.data$education
my.data$n.education[my.data$n.education<7.5] <- 7.5

#number of observations in the data
nrow(my.data)
#We make the variables directly accessible
attach(my.data)
#mean education
mean(n.education)
#Table 1 on slide 9
table1 <- cbind(table(n.education),
                round(prop.table(table(n.education))*100,digits = 2))
table1 <- data.frame("Education" = rownames(table1), "Frequency" = table1[,1], "Probability" = table1[,2])
rownames(table1) <- NULL
table1 <- knitr::kable(table1, format="latex", booktabs = TRUE, linesep = "")
kableExtra::save_kable(table1, file = "table1.tex")

#Histogram on slide 10
mean(wage)
pdf(file = "figure1.pdf", width = 10, height = 6)
hist(wage[wage<100], main = "Histogram of wages", xlab="Hourly wage")
dev.off()

#Density on slide 11
pdf(file = "figure2.pdf", width = 10, height = 6)
plot(density(wage[wage<100]), main = "Density of wages", xlab="Hourly wage", lwd=2)
dev.off()

#Table 2 on slide 13
table2 <- round(100 * cbind(rbind(prop.table(table(sex, n.education)), prop.table(table(n.education))), c(prop.table(table(sex)),1)), 2)
table2 <- kable(table2, booktabs = TRUE, format = "latex", linesep = "")
table2 <- add_header_above(table2, c(" ", "Education" = 10))
table2 <- kable_styling(table2, latex_options = c("scale_down"))
kableExtra::save_kable(table2, file = "table2.tex")

#Table 3 on slide 14
table3 <- round(100 * cbind(prop.table(table(sex, n.education), margin = 1), c(1,1)), 2)
table3 <- kable(table3, booktabs = TRUE, format = "latex", linesep = "")
table3 <- add_header_above(table3, c(" ", "Education" = 10))
table3 <- kable_styling(table3, latex_options = c("scale_down"))
kableExtra::save_kable(table3, file = "table3.tex")

#Figure on slide 15
pdf(file = "figure3.pdf", width = 10, height = 6)
plot(density(wage[wage<100 & n.education==12]), main = "Density of wages", xlab="Hourly wage", lwd=2)
lines(density(wage[wage<100 & n.education==16]), col="red", lwd=2)
legend(60,0.06, c("Education = 12", "Education = 16"), col = c("black", "red"), lwd=2)
dev.off()

#Figure on slide 16
m.wage.education <- tapply(wage, n.education, mean)
pdf(file = "figure4.pdf", width = 10, height = 6)
plot(m.wage.education ~ as.numeric(names(m.wage.education)), main="Conditional mean wage", ylab="Mean wage", xlab="Education in years", pch = 16, cex = 1.5)
dev.off()

#Figure on slide 17
f2 <- kde2d(wage, age, n = 50, lims = c(0, 100, 25, 65))
pdf(file = "figure5.pdf", width = 10, height = 6)
persp(f2$x, f2$y, f2$z, theta = 20, phi = 25, shade = 0.75, col = "gold", expand = 0.5, r = 2,
      ltheta = 25, ticktype = "simple", xlab="Wage", ylab = "Age", zlab="Density")
dev.off()

#Figure on slide 18
m.wage.age <- tapply(wage, age, mean)
pdf(file = "figure6.pdf", width = 10, height = 6)
plot(m.wage.age ~ as.numeric(names(m.wage.age)), main="Conditional mean wage", ylab="Mean wage", xlab="Age in years", pch = 16, cex = 1.5)
dev.off()

#Slide 36: conditional means, variances and standard deviations
mean(wage[n.education==12])
mean(wage[n.education==16])
var(wage[n.education==12])
var(wage[n.education==16])
sd(wage[n.education==12])
sd(wage[n.education==16])

#Slide 37
#mean wage for young people
mean(wage[age<35])
#mean wage for old people
mean(wage[age>=35])
#proportion of young people
mean(age<35)
#weighted mean of the conditional means
mean(wage[age<35])*mean(age<35)+mean(wage[age>=35])*mean(age>=35)
#unconditional mean (the same as the previous line, which confirms the law of iterated expectation)
mean(wage)
