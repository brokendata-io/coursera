df <- read.table('Stats1.13.HW.02.txt', header = T)

#1: how many rows are in the data file? 

#answer:
dim(df)
# = 96

#2: What is the dependent variable?
#SR

#3: what is the mean SR across all subjects
mean(df$SR)


#question 9 which is the best approx of normal distribution 
par(mfrow = c(2,3)) # To view 6 histograms on one page 

pre <- df$time =='pre'
post <- df$time == 'post'

df_pre <- subset(df,pre)
df_post <- subset(df,post)

par(mfrow = c(2,3))
hist(df_pre$SR[df_pre$condition == 'WM'])
hist(df_post$SR[df_post$condition == 'WM'])
hist(df_pre$SR[df_pre$condition == 'PE'])
hist(df_post$SR[df_post$condition == 'PE'])
hist(df_pre$SR[df_pre$condition == 'DS'])
hist(df_post$SR[df_post$condition == 'DS'])