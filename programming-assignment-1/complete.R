complete <- function(directory, id = 1:332) {
    fnames <- sprintf("%03d.csv", id)
    files <- file.path(directory, fnames)
    nocc <- integer()
    
    for(f in files){
        data <- read.csv(f)
        nocc <- c(nocc, nrow(data[complete.cases(data),]))
    }
    
    data.frame(fnames, nocc, stringsAsFactors=FALSE)
}