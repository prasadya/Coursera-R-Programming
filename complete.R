#Programming assignment 1 in class 2

setwd("")

complete <- function(directory,id = 1:332) {
  
  # set specdata folder as the working directory if the spec folder exists
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }

  # list files and create access strings
  files <- as.character(list.files(directory))
  paths <- paste(directory,files, sep = "")
  
  ids <- c()
  nobs <- c()
  
  # loop through files by id index
  for (item in id){
    specDataTemp <- read.csv(paths[item], header = TRUE)
    pollutantNA <- complete.cases(specDataTemp)
    ids <- c(ids,item)
    nobs <- c(nobs,nrow(specDataTemp[pollutantNA,]))
     
  }
  
  return(data.frame(id = ids, nobs = nobs))
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

