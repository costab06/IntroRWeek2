corr <- function(directory, threshold = 0) {
        
        ## process all files
        fileList = list.files(directory, full.names=TRUE) 
        
        ## build up a dataframe of cor for files that have 
        ## complete observations > threshold
        dat <- numeric()
        
        for (fileName in fileList) {
                tmp <- read.csv(fileName)
                
                ##subset to complete cases
                complete <- tmp[complete.cases(tmp), ]
                
                ## if nrow > threshold then calculate the cor and add to the vector
                nrows <- nrow(complete)
                if (nrows > threshold) {
                        
                        ## pull the SUlfites and nitrites coumns as vectors
                        sulfate <- complete[ , "sulfate"]
                        nitrate <- complete[ , "nitrate"]
                        ## run cor on the vectors
                        correlation <- cor(sulfate,nitrate)
                        ## add the results to the vector to be returned
                        dat <-append(dat,correlation)
                }
                
               
        }

        ## return dat
        dat
}
        
        
        