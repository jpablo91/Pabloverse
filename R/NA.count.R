#' Function to count NAs
#' 
#' @param x A vector of values
#' @export

NA.count <- function(x){
  sum(is.na(x))/length(x)
}