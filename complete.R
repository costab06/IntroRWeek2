complete <- function(directory, id = 1:332) {
        
        dat <- data.frame()
        
        for (i in id) {
                fileName <- sprintf("%s\\%03d.csv",directory,i)

                ## read the file into a tmp dataframe
                tmp <- read.csv(fileName)
                
                ## subset for complete cases
                complete <- tmp[complete.cases(tmp), ]
                
                
                ## get nrow from subset
                nrows <- nrow(complete)
                
                
                
                ## add the id and nrow to dataFrame
                dat <- rbind(dat,data.frame("id"=i,"nobs"=nrows))
        }                
 
        ## return dataFrame
        dat
        
        
}