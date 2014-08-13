## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	m1 <- NULL
	set <- function(y) {
		x <<- y       ## put it in x using superassignment http://article.gmane.org/gmane.comp.lang.r.general/227066
		m1 <<- NULL   ## clear inverse of matrix, as we don't know it
	}
	
	get <- function() x    ## simply return x
	
	getinverse <- function() m1   ## simply return m1

	setinverse <- function(minv) m1 <<- minv    ## set inverse of matrix using what we got
	## now construct object
	list (set = set,
	      get = get,
		  getinverse = getinverse,
		  setinverse = setinverse )
}


## Write a short comment describing this function
cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()   ## get inverse
        if(!is.null(m)) {     ## check if it not NULL -- something is cacehd
                message("Cached:")
                return(m)
        }
		## if nothing cached...
        data <- x$get()     ## get data 
        m <- solve(data)    ## calculate inverse matrix
        x$setinverse(m)     ## put it back
        m                   ## print it
}
