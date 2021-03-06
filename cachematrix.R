#!/usr/bin/env Rscript

# **********************************************
# DESCRIPTION
# ----------------------------------------------
# Simple example demonstrating the usage of
# 'solve' to calculate the inverse of a 3-by-3-
# matrix:
#
# > a <- matrix(c(1,2,3,2,3,4,0,0,1), ncol=3)
# > a
#      [,1] [,2] [,3]
# [1,]    1    2    0
# [2,]    2    3    0
# [3,]    3    4    1
#
# The inverse matrix x^{-1} solves the equation
# x * x^{-1} = i
# where '*' indicates matrix multiplication and
# 'i' is the unit matrix. The unit matrix is
# defined by
#
#> i <- diag(3)
#> i
#     [,1] [,2] [,3]
#[1,]    1    1    1
#[2,]    1    1    1
#[3,]    1    1    1
#
# and so the inverse can be calculated as
#
# > x <- solve(a,i)
# > x
#      [,1] [,2] [,3]
# [1,]   -3    2    0
# [2,]    2   -1    0
# [3,]    1   -2    1
# 
# It can be checked if this matrix indeed solves
# the equation a*x = i by matrix multiplication
# using 'round' to remove numerical noise in the
# solution:
#
# > round(a %*% x, 15)
#      [,1] [,2] [,3]
# [1,]    1    0    0
# [2,]    0    1    0
# [3,]    0    0    1
# 
# ----------------------------------------------


# **********************************************
# REQUIREMENTS
# ----------------------------------------------
# The provided matrix has to be quadratic.
# If quadratic, invertability is assumed.
# ----------------------------------------------



# **********************************************
# ASSIGNMENT
# ----------------------------------------------
# Create and return a special matrix object
# that can cache its inverse.
makeCacheMatrix <- function(x = matrix())
{
    # Cache
    cache = NULL
    
    # Set matrix in defining environment and reset cache.
    set_matrix <- function(input)
    {
        x <<- input
        cache <<- NULL
    }

    # Accessing function
    get_matrix <- function()
    {
        x
    }

    # Write inverse into cache
    set_inverse <- function(inverse)
    {
        cache <<- inverse
    }
    
    # Access inverse from cache
    get_inverse <- function()
    {
        cache
    }
    
    # Return the special matrix.
    list(    get=get_matrix,      set=set_matrix,
         get_inv=get_inverse, set_inv=set_inverse)
}

# Calculate and return the inverse matrix of 'x'.
cacheSolve <- function(special_matrix, ...)
{
    # Query the cache of the special_matrix.
    tmp <- special_matrix$get_inv()

    # If inverse already calculated and x not changed
    # then the inverse is retrieved from cache.
    if(!is.null(tmp))
    {
        message("Getting cached inverse matrix.")
        return(tmp)
    }

    # Calculate the inverse and writing to cache.
    data           <- special_matrix$get()
    unit_matrix    <- diag(ncol(data))
    inverse_matrix <- solve(data, unit_matrix)
    special_matrix$set_inv(inverse_matrix)
    return(inverse_matrix)
}
