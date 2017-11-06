makeVector <- function(x=numeric()){
  
  m<-NULL
  set <- function(y){
    x<<-y
    m<<-NULL
  }
  get <- function()x
  setmean <-function(mean){
    m <<- mean
  }
  getmean <- function() m

  list(set=set, get=get, setmean=setmean, getmean=getmean)
  
}

cacheMean<-function(x,...){
  m<-x$getmean()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-mean(data,...)
  x$setmean(m)
  m
}

makeCacheMatrix<-function(x=matrix()){
  inv <- NULL
  setmatrix <- function(y){
    x<<-y
    inv <<- NULL
  }
  getmatrix <- function() x
  setInverse<-function(inve){
    inv<<-inve
  }
  getInverse <- function() inv
  list(setmatrix=setmatrix, getmatrix=getmatrix, setInverse=setInverse, getInverse=getInverse)
}

CacheSolve <-function(x=matrix(),...){
  
inv<-x$getInverse()
if (!is.null(inv)){
  message("getting the cached data")
  return(inv)
}
  data<-x$getmatrix()
  inv<-solve(data,...)
  x$setInverse(inv)
  inv
  
}
