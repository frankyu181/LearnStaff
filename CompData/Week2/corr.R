corr <- function(directory, threshold = 0) {
  ids = 1:332
  ids <- cases$id[cases$nobs>=threshold]
  f <- function(id) {
    data <- getmonitor(id,directory)
    selected <- !is.na(data$sulfate)&!is.na(data$nitrate) 
    if (length(selected==T)>threshold) {
      cor(data$sulfate[selected],data$nitrate[selected])  
    } 
  }
  sapply(ids,f)
}