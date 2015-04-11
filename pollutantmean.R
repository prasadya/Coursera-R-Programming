#Programming assignment 1 in class 2
#Calculates the mean of the combined specdata datasets as specified by the id parameter.

setwd("")

pollutantmean <- function(directory, pollutant,id = 1:332) {
  
  # set specdata folder as the working directory if the spec folder exists
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  # initialize mean vector
  mean_vector <- c()
  files <- as.character(list.files(directory))
  paths <- paste(directory,files, sep = "")
  
  # loop through files by id index
  for (item in id){
    specDataTemp <- read.csv(paths[item], header = TRUE)
    pollutantNA <- is.na(specDataTemp[,pollutant])
    specDataTemp <- specDataTemp[!pollutantNA,]
    mean_vector <- c(mean_vector,specDataTemp[,pollutant])    
  }

   return (mean(mean_vector))
}


pollutantmean("specdata", "sulfate", 1:10) == 4.064
pollutantmean("specdata", "nitrate", 70:72) == 1.706
pollutantmean("specdata", "nitrate", 23) == 1.281
