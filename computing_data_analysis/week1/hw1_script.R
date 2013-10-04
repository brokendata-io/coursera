x<-list.files() # list the files in the current working directory 
print(x)

hw <- x[1]
print(hw)

frame <- read.csv(hw) # read the data into a dataframe 


#Question 1: what are the column names of the dataset? 
#Answers: 

#Answer: 
head(frame)  # shows you the column names and first 6 rows of your data frame

#Question 2: Extract the first 2 rows of the data frame and print them to the console 
frame[1:2,]  


#Question3: How many observations (rows) are in this frame? 
#Answer: 
#use the built nrow() function 
nrow(frame)

#Question4: extract the last 2 rows of the dataframe: 
frame[151:153,]

frame[47,]

#Question6: how many missing values are in the Ozone column of this data 
na <- is.na(frame$ozone) # returns true if na
sum(na) 


# Question 7: What is the mean of the Ozone column in this dataset: 
#Answer: 


oz <- frame$Ozone 
nas <- is.na(oz)
clean <- oz[!nas]
mean(clean)

#Question 8: Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset
#Answer: 

x <-frame$Solar.R[frame$Ozone > 31 & frame$Temp > 90] # gets us the values but it has NA still 
nas <- is.na(x)
y <- x[!nas]
mean(y)

# What is the mean temp when month is equal to 6 
t <-frame$Temp[frame$Month == 6]
mean(t)

#What was the maximum ozone value in the month of May (Month =5)
oz <- frame$Ozone[frame$Month == 5]
oz <-[is.na(oz)] <- 0 
max(oz)


