#Programming assignment 1 in class 2

setwd("/Users/yashvirprasad/Desktop/Coursera Data Science/class2")

corr <- function(directory, threshold = 0) {
  
  # set specdata folder as the working directory if the spec folder exists
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  # list files and create access strings
  files <- as.character(list.files(directory))
  paths <- paste(directory,files, sep = "")
  cord <- as.numeric(c())
  # loop through files by id index
  
  for (item in paths){
    specDataTemp <- read.csv(item, header = TRUE)
    pollutantNA <- complete.cases(specDataTemp)
    specDataTemp <- specDataTemp[pollutantNA,]
    
    if (nrow(specDataTemp) > threshold) {
      cord <- c(cord, cor(specDataTemp$nitrate, specDataTemp$sulfate))
    } 
  }
  return(cord)
}

cr <- corr("specdata")
head(cr)
summary(cr)
length(cr)
