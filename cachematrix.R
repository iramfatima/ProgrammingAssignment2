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
