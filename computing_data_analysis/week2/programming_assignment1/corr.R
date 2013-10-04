source('complete.R')
source('getmonitor.R')

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations

   lookup.nobs <- complete('specdata')      #create lookup table of ids and complete cases; colnames = id,nobs 
   predicate <- lookup.nobs$nobs > threshold 
   id <- lookup.nobs$id[predicate]       # select id from lookup.nob where nobs > threshold (returns vector)
   corrs <- {}                          # instantiate an empty vector
   for (i in id) {
     df <- getmonitor(id = i,directory = directory)
     clean.df <- na.omit(df)
     i.corr <- cor(clean.df$sulfate,clean.df$nitrate)
     corrs <- c(corrs,i.corr)
   }
   
   return(corrs)

}