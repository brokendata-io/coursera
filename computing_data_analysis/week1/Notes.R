" 
Notes: 

-There are a small number of atomic data types 
-vectors must all be of the same type 
-lists are like vectors but of mixed type


-length
-other user-defined attributes/metadata 

<- is the assignment expression 

"
x <- 5 

# assigns the vlaue of 5 to x 
# when you just type an objects name, R will auto print the object by default


#The c() function can be used to creat vectors 
d <- c(.4,.5) # numeric 
a <- c(T,F) # boolean 
s <= c("a","b") # character

# When differen objects are mixed in a vector, coercion occurs so that every element in the vector is of the same class
y <-c(1.8, "a") # gets turned into ("1.8","a")

as.character(x)
# will convert x into characters

as.numeric(x)
# will convert x into numeric 
class(x)
# will return the class or type

#-----------------------------------------------------
#
# MATRICES 
#

# Matrices are vectors witha  dimension attribute, THe dimension attribute is itself an integer vector of length 2(nrom, col)
m <- matrix(nrow=2, ncol = 3)

dim(m)
#will show the dimensions of the matrix 

#matrices are constructed columnwise
m <- matrix(1:6, nrow=2,ncol=3)


# matrices can be created directly from the vectors by adding a dimentsion attribute 
m <- 1:10 
dim(m) <- c(2,5)

# matrices can be created by column-binding and row binding 
x <- 1:10 
y <- 11:20 

m <- cbind(x, y )
"
 [1,]  1 11
 [2,]  2 12
 [3,]  3 13
 [4,]  4 14
 [5,]  5 15
 [6,]  6 16
 [7,]  7 17
 [8,]  8 18
 [9,]  9 19
[10,] 10 20
"
m <- rbind(x,y)
"
  [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
x    1    2    3    4    5    6    7    8    9    10
y   11   12   13   14   15   16   17   18   19    20

"
#----------------------------------------------------------------------
#
#LIST
#
#list are a special type of vector that can contain elements of differen classes 

x<- list(1,"a",TRUE,1 + 4i)
#lists ar indexed and each element is a vector 

#----------------------------------------------------------------------
#
#FACTORS
#
# factors are used to represent categorical data, Factors can be unordered or ordered. One can think of a factor as an integer 
# vector where each integer has a label


#----------------------------------------------------------------------
#
#MISSING 
#
# missing values are denoted by NA or NaN for undefined 
is.na(x)
# is used to test objects if they are NA 
is nan(x)
# is used to test for NaN
x<- c(1,2,3,NA,3)
is.na(x)
"
[1] FALSE FALSE FALSE  TRUE FALSE
"
#---------------------------------------------------------------------
# 
#DATA FRAME 
#
#used to store tabluar data. 
#each column is a list, with all lists having the same length 
# can be mixed type

x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
"
  foo   bar
1   1  TRUE
2   2  TRUE
3   3 FALSE
4   4 FALSE
"
nrow(x) # will return the number of rows 
ncol(x) # will return the number of columns 

#--------------------------------------------------------------------
# 
#NAMES 
# 
#R objects can have names 

x<-(1:3)
print(x)
" 
[1] 1 2 3 
"
names(x) 
"
NULL
"
names(x) <- c("foo","bar","norf")
print (x)
"
 foo  bar norf 
   1    2    3 
"
#usefull for readable code and self describing objects 

#lists can also have names zz
x <- list(a = 1x <, b = 2, c  = 3)z 

#matrices can have names 
m <- matrix(1:4, nrow =2, ncol =2)
#use dimnames() to view the names 

                      #first list is vector of row names 
dimnames(m) <- list(c("a","b"), c("c","d"))
                                #secon list is vector of column names

print(m)
"  
c d
a 1 3
b 2 4

"

#**************************************************************************************************
#end of video Week1:Data Types 
#Subsetting 

# subestting with [] always returns an obhject of the same class as the original 
# subsetting with [[]] is used to extract elements of a list or data frame; it can only be used to extract a single element and the class will not necessarily be that of the set
# $ is used to extract elements of a list or data frame by name. similar to [[]]

#List indexing ******************* 
x<- c("a","b","c","c", "d","a") 

x[1]
"
[1] "a"
"
# supports boolean indexing (logical)
x[x > "a"]
"[1] "b" "c" "c" "d"
"
#Matrix indexing  ******************* 
x <- matrix(1:6,2,3)
print(x)
"
      [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
"
x[1,2]     # x[ROW,COLUMN]
"
[1] 3
"
#indexes can also be missing 
x[1,]               #first row of the matrix 
"[1] 1 3 5
"
x[,2]               #second column of the matrix
"
[1] 3 4
"
# when you are subsetting a matrix drop = False will NOT drop the dimensions from the matrix 

#Subsetting Lists  ******************* 
x <- list(foo = 1:4, bar = 0.6) 


#subsetting nesetd lists

#Removing NA Values   ******************* 

x<- c(1,2,3,NA,NA,5)  

bad <- is.na(x) #  tales the boolean values: [1] FALSE FALSE FALSE  TRUE  TRUE FALSE and assigned it to the variable bad 

x[!bad] # boolean indexing is supported, so this returns all the values that are not NA
"
[1] 1 2 3 5
"

#subsetting with multiple lists 
x <- c(1,2,NA,NA,5,7)
y <- c("a", "b",NA,, NA,"g","f")

#we use the function compleate.cases() and pass in the vectors x and y 
#return a logical vector indicating which cases are complete, i.e have no missing values 
complete.cases(x,y)

#**************************************************************************************************
#Reading Data into R Video 

#Reading 
read.table, read.csv # for reading tablular data 
source # for reading R code (inverse is dump)
dget # for reading r in R code files
#

#writing 
write.table 
writeLines 
dump  #textual format that also preserves the metadata, can dump multiple R objects
dput # will construnct R code that will allow you to dget the data, can only be used on a single R object
save 
serialize
#
#read.table is the most commonly used functions for reading data and has these important arguments: 
file - #the name of the file or connection 
header, #header, logical indicating if the file has a header line 
sep, # a string indicating how the columns are seperated 
colClasses, #a character vector indicating trhe class of each column in the dataset
nrows, # the number of rows in the dataset 
comment.char, # a character string indicating the comment character 
skip # the number of lines to skip from the beginning 
stringsasFactors, # should character variables be coded as factors

# for small to moderate sized data you can usually call read.table without specifying anything 
# R will automatically 
# - skip lines with # 
# - figure out the rows 

# read.csv is the same as read.table but the default sep is set to a  comma 

#IMPORTANT 
# specifiying the colClasses manually can speed up the read by twice as much, if you dont know the classes you can do the following 
 
initial <- read.table('data.txt', nrows = 100) # only grab some of your data 
columns <- sapply(initial,class) # this will return the class for each column in initial, similar to the map() function in python  
table <- read.table('data.txt', colClasses=columns)

#rule of thumb: usually need twice as much ram as size of data 
#*******************************************************************************************
#
#str function 
#
# a diagnostic function and alternative to summary 
# it is especially well suited to compactly display the contents of lists