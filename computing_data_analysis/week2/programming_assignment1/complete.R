source('getmonitor.R')

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  final <- data.frame(id = integer(), nobs = integer())  # initialize an empty dataframe
  
  for (i in id){                                        
    df <-getmonitor(id = i, directory)                  # getmonitor reads the file with the specified id and returns it as a dataframe
    nobs <- sum(complete.cases(df))
    final <- rbind(final, data.frame(id = i, nobs = nobs))
  }
  return(final)
}