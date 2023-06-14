#' Function to Count the words in a string of text
#' 
#' @param x string of text to count
#' @export
#' 
wordCount <- function(x){
  length(strsplit(x, ' ')[[1]])
}