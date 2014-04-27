#!/usr/bin/env Rscript

makeVector <- function(x = numeric())
{
        # Cache
        m <- NULL
        
        # Set vector and reset cache.
        set <- function(y)
        {
                x <<- y
                m <<- NULL
        }

        # Return vector
        get <- function()
        {
            x
        }

        # Set mean value
        setmean <- function(mean)
        {
            m <<- mean
        }

        # Get value of mean
        getmean <- function()
        {
            m
        }

        # Return list of functions.
        list(setvector = set,   getvector = get,
               setmean = setmean, getmean = getmean
            )
}

# Expects a special vector as prepared by makeVector.
cachemean <- function(x, ...)
{
        # Query the 'x' vector's cache
        m <- x$getmean()
        
        # If cache 'm' is not null, return cache.
        if(!is.null(m))
        {
                message("Getting cached data.")
                return(m)
        }

        # Else, i.e. no cache available.
        message("No cache available.")
        data <- x$getvector()
        m    <- mean(data, ...)

        # Save calculated mean to the special vector.
        x$setmean(m)

        # Return calculated mean.
        return(m)
}
