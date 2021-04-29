#' Function to clean the units
#' 
#' @param x A variable with a unit 
#' @export

clean_units <- function(x){
  attr(x,"units") <- NULL
  class(x) <- setdiff(class(x),"units")
  x
}