# x <- read.table("specdata/001.csv",sep=",")

fname <- function(id,directory) {
  if (is.integer(id)||is.numeric(id)) {
    id <- sprintf("%03d",id);
  }
  paste(directory,"/",id,".csv",sep="")
}


getmonitor <-function(id, directory, summarize=FALSE) {
  fn = fname(id,directory)
  monitor <- read.table(fn, sep=",",header=TRUE)
  if (summarize) {
    print(summary(monitor))
  }
  monitor
}


complete <- function(directory, id = 1:332) {
  
  nobs = c()
  p = 1
  for(i in id) {
    data = getmonitor(i, directory)
    # y = data$sulfate[!is.na(data$nitrate)]
    #nobs[p] = length(y[!is.na(y)])
    nobs[p] = sum(!is.na(data$nitrate)&!is.na(data$sulfate)) 
    p <- p + 1
  }
  data.frame(id,nobs)
}
#x = getmonitor(1,"specdata/",summarize=TRUE)
#print(x)