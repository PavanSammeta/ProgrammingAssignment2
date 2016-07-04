## This code computes inverse of given matrix first time and stores it in cache.
## It then retrieves inverse value from cache if the input matrix remains same 
## in consecutive calls to the function. 

## Function to create a list object which has the following functions
##1. get the value of the matrix
##2. set the value of the matrix
##3. get the value of the inverse matrix
##4. set the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
		m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve(x)
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Function to compute inverse of given matrix and store it in cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached matrix data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}
