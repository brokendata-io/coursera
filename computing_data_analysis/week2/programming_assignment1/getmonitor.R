getmonitor <- function(id, directory, summarize = FALSE) {
  ## 'id' is a vector of length 1 indicating the monitor ID
  ## number. The user can specify 'id' as either an integer, a
  ## character, or a numeric.
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'summarize' is a logical indicating whether a summary of
  ## the data should be printed to the console; the default is
  ## FALSE
  
  ## Your code here
  id <- as.integer(id)                                # cast id as int 
  
  #------------ create correct filename
  if (id < 10){
    id <- paste('00',id,sep='')       
    
  }
  if (id >9 & id <100){ 
    id <- paste('0',id,sep='')}
  #------------ end filename create 
  
  #add file extension, concatenate path
  file <- paste(id,'.csv',sep='')
  directory <- paste(directory, '/',sep='')
  path <- paste(directory,file,sep='')
  
  #create dataframe
  df <- read.csv(path, header = TRUE)

  if (summarize == TRUE){
   print(summary(df))
   return(df) 
  }else{ 
 return(df)}


}