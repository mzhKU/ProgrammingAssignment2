# A data structure for caching a matrix inversion

## Description
The script provides two functions:
- makeCacheMatrix
- cacheSolve

## Requirements
Basic functionality is shown below.
```
m <- makeCacheMatrix(matrix(sample(1:9), ncol=3))
> m$get()
     [,1] [,2] [,3]
[1,]    8    2    9
[2,]    6    1    5
[3,]    3    4    7
> cacheSolve(m)
           [,1]       [,2]        [,3]
[1,] -0.4193548  0.7096774  0.03225806
[2,] -0.8709677  0.9354839  0.45161290
[3,]  0.6774194 -0.8387097 -0.12903226
> m$get_inv()
             [,1]        [,2]         [,3]
[1,] -0.095070423  0.21830986 -0.003521127
[2,]  0.144366197 -0.03521127 -0.031690141
[3,] -0.007042254 -0.16901408  0.147887324
> m$set(matrix(sample(1:9), ncol=3))
> cacheSolve(m)
            [,1]        [,2]       [,3]
[1,]  0.13333333 -0.20000000  0.3333333
[2,] -0.09696970  0.05454545  0.1212121
[3,]  0.04242424  0.16363636 -0.3030303
> cacheSolve(m)
Getting cached inverse matrix.
            [,1]        [,2]       [,3]
[1,]  0.13333333 -0.20000000  0.3333333
[2,] -0.09696970  0.05454545  0.1212121
[3,]  0.04242424  0.16363636 -0.3030303
```
The argument provided to `makeCacheMatrix` has to be
of class `matrix`.
