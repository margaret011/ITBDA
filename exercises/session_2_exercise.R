#2.1
set.seed(8)
x <- runif(100, 1, 100)
mean_x <- round(mean(x), 2)
mean_x
#2.2
x <- seq(1,1000)
x <- 1:1000
y <- rep(999, length(x))
x+y
sum(x)+sum(y)
#2.3
n <- 1e4
scale <- 1.5e4
income <- round( rbeta(n=n, shape1=2, shape2=12) * scale, 2)
?rbeta
library(ggplot2) # only load (run) once
# Plot the resulting curve
ggplot(data.frame(x = income), aes(x=x)) +
  geom_histogram(color = "#0065BD", fill = "#0065BD", alpha=0.5, bins = 100) +
  scale_x_continuous(breaks = seq(0, scale, 1e3)) + 
  labs(x = "Gross income", 
       y = "Counts") + 
  theme_minimal()

share <- income/sum(income)

income_s <- sort(income) #sort the income

group <- c("Lower 1%", "Lower 50%", "Top 10%", "Top 1%")
p <- c(.1, .5, .9, .99) #create percentage group
boundary <- round(income_s[p*n], 0) 
#calculate the upper boundary for each percentage group

low10_m <- mean( income_s[c(1:(.1*n))] )
low50_m <- mean( income_s[c(1:(.5*n))] )
top10_m <- mean( income_s[c((.9*n):n)] )
top1_m <- mean( income_s[c((.99*n):n)] )
#calculate the mean of each group
means <-  round( c(low10_m, low50_m, top10_m, top1_m) , 0)

income_summary <- data.frame(group, boundary, means)
income_summary

#3
v1 <- c(1:5)
v2 <- c(6:10)
v3 <- c(11:15)
v4 <- c(16:20)
v5 <- c(21:25)
df <- data.frame(v1,v2,v3,v4,v5)
means <- sapply(df, mean)
means
library(tidyverse)
names(diamonds)
View(diamonds)
which(diamonds$cut =='Ideal')
ideal_cut <- diamonds[which(diamonds$cut=='Ideal'),]
ideal_cut
?filter
diamonds%>%filter(cut=="Ideal")
?select