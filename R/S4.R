#' s4.data.frame
#' 

setClass( "s4.data.frame", contains="data.frame" )

setClass( "s4.list", contains="list" )

setClass( "s4.vector", contains="vector" )

if( require(data.table) )
  setClass( "s4.data.table", contains="data.table" )

#' S4
#' 
#' Return an S4 variant of the supplied object
#' 
#' @param x 
#' @S3method
#' @export

S4 <- function(x) UseMethod("S4")

#' 
S4.data.frame <- function(x) new( "s4.data.frame", x)

#' 
S4.vector <- function(x) new( "s4.vector", x)

s4 <- new( "s4.data.frame", iris  )

setMethod( "["
 , signature( x="s4.data.frame", i="integer", j="ANY", drop="ANY")
 , function(x,i,j,...,drop) 1
)

s4[s4.data.frame]

setMethod( "["
   , signature( x="data.frame", i="integer", j="ANY", drop="ANY")
   , function(x,i,j,...,drop) 1
)

s4[2L]

setMethod( "["
           , signature( x="s4.data.frame", i="integer", j="ANY", drop="ANY")
           , function(x,i,j,...,drop) 1
)


setMethod( "["
  , signature( x="s4.data.frame", i="missing", j="missing", drop="missing")
  , function(x,i,j,...,drop) 42
)
s4[]

setMethod( "["
   , signature( x="s4.data.frame", i="integer", j="missing", drop="missing" )
   , function(x,i,j,...,drop) 43
)

s4[2L]

setMethod( "["
   , signature( x="s4.data.frame", i="numeric" )
   , function(x,i) 44
)
s4[2]
