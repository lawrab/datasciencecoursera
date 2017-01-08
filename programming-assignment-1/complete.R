complete <- function(directory, id = 1:332) {
    fnames <- sprintf("%03d.csv", id)
    files <- file.path(directory, fnames)
    nobs <- integer()
    
    for(f in files){
        data <- read.csv(f)
        nobs <- c(nobs, nrow(data[complete.cases(data),]))
    }
    
    data.frame(fnames, nobs, stringsAsFactors=FALSE)
}