## Put comments here that give an overall description of what your
## functions do
## we cached the function to invert an invertible matrix "solve()"
## in order to make this time concuming operation
## reutilisable in prospective stages 

## Write a short comment describing this function
## function creates a list which contains functions to
## set a matrix, get a matrix,set the function solve and 
## get the function
## matrix() is a default parmeter to return an empty matrix


makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
        
}


## Write a short comment describing this function
## function which applies the function solve()
## to the vector created , when the invert matrix has
## already been created with the above function,
## it gets this result, and in that case the message 
## "getting cached data" appears sonst, the invert
## matrix is calculated and shower wih no message.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
