pollutantmean <- function(directory, pollutant, id=1:332) {
        
        ## get a list of the files    
        fileList <- getFileNames(directory, id)
      
        ## load into dataframe with rbind        
        dat <-loadDataFrame(fileList)
       
       ## get the mean, ignoring NA values
       mean(dat[, pollutant], na.rm=TRUE)
}


getFileNames <- function(directory, id) {
        
        ## create an empty character vector for the filenames
        fileList <- character()
        
        ## build up filenames and add to the character vector
        for (i in id) {
                fileName <- sprintf("%s\\%03d.csv",directory,i)
                fileList <- append(fileList,fileName)
        }
        
        ## return character vector
        fileList
}


loadDataFrame <- function(fileList) {

        ## create an empty dataframe
        dat <-data.frame()
        
        ## iterate over the specified files and rbind to the dataframe
        numFiles <- length(fileList)
        for (i in 1:numFiles) {
                dat <- rbind(dat, read.csv(fileList[i]))
        }

        ## return the populated data frame
        dat
}
