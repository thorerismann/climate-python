# load in data
d = c(1,1,1,0,0,0)
y_1 = c(1,1,1,0,0,1)
y_2 = c(1,0,0,0,0,0)
df <- as.data.frame(cbind(d,y_1,y_2))

# calculate ATE using (1)
ate = (sum(df$y_1)-sum(df$y_2))/6

# calculate att by subtracting as inin

trues <- df[df$d == 1,]
falses <- df[df$d == 0,]
att =  (sum(trues$y_1)-sum(trues$y_2))/3
atc =  (sum(falses$y_1)-sum(falses$y_2))/3

ate_est = sum(trues$y_1-falses$y_2)/6

# load in data
d = c(1,1,1,0,0,0)
y_1 = c(1,1,1,0,0,1)
y_2 = c(1,0,0,1,1,1)
df <- as.data.frame(cbind(d,y_1,y_2))

# calculate ATE using (1)
ate_ = (sum(df$y_1)-sum(df$y_2))/6

# calculate att and atc

trues <- df[df$d == 1,]
falses <- df[df$d == 0,]
att_ =  (sum(trues$y_1)-sum(trues$y_2))/3
atc_ =  (sum(falses$y_1)-sum(falses$y_2))/3

# estimate ATE
ate_est_ = sum(trues$y_1-falses$y_2)/6