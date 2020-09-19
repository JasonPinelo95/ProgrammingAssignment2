## These are two functions that use the lexical scoping of R. The first one
## receives a matrix and calculate its inverse and store it in the parent environment
## The second one, calculate the inverse of the matrix created with the first function
## if the inverse matrix is cached, then only returns the cached matrix, otherwise
## performs the computation and returns the inverse

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  my_matrix<<-x
  my_inverse<<-solve(x)
  list(my_matrix=my_matrix,my_inverse=my_inverse)
}


## This function returns a cached matrix calculated by the above matrix if exists.
## Otherwise the function calculates the inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse<-x$my_inverse
  if(!is.null(inverse)){
    message("Getting cached matrix")
    return(inverse)
  }
  inverse<-x$my_matrix
  inverse
}
