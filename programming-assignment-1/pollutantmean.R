pollutantmean <- function(directory, pollutant, id = 1:332){
    fnames <- sprintf("%03d.csv", id)
    files <- file.path(directory, fnames)
    xs <- numeric()
    
    for(f in files){
        data<-read.csv(f)
        p<-data[[pollutant]]
        bad <- is.na(p)
        xs <- c(xs, p[!bad])
    }

    mean(xs)
}