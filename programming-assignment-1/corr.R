corr <- function(directory, threshold = 0) {
    files <- list.files(file.path(directory), full.names = TRUE)
    
    ret <- vector()
    
    for(f in files) {
        data <- read.csv(f)
        completeData<-data[complete.cases(data),]
        
        if(nrow(completeData) > threshold) {
            t <- cor(completeData$sulfate, completeData$nitrate)
            ret <- c(ret, t)
        }
    }
    
    if(length(ret) == 0) {
        ret<-numeric(0)
    }

    ret
}