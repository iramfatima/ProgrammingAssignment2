makeCacheMatrix<-function(x=matrix()){ #thisFunction will set and get the inverseable matrix
  inv <- NULL #initially inv is Null
  setmatrix <- function(y){ #this function will help set the matrix
    x<<-y  #Assigned the coming matrix to matrix associated with makeCacheMatrix
    inv <<- NULL #inv is still be null
  }
  getmatrix <- function() x # This line will return the matrix 
  setInverse<-function(inve){ #this line will set the insverse matrix
    inv<<-inve
  }
  getInverse <- function() inv  #This line will get the inverse matrix
  list(setmatrix=setmatrix, getmatrix=getmatrix, setInverse=setInverse, getInverse=getInverse)
}

CacheSolve <-function(x=matrix(),...){  # This function calculate the inverse of matrix
  
inv<-x$getInverse() # it will get the matrix inverse
if (!is.null(inv)){ #if marix inverse is not null
  message("getting the cached data")
  return(inv) # retireve the previously calculated inverse
}
  data<-x$getmatrix() #retrieve the matrix
  inv<-solve(data,...) #calculate the matrix inverse
  x$setInverse(inv) #set the matrix inverse 
  inv #return matrix inverse
  
}
