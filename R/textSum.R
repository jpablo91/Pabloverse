#' Function to get a summary in a string of text
#' 
#' @param x string of text to count
#' @param remmoveCommon Remove the common words (i.e. 'a', 'are', 'the', ...)
#' @export
#' 
textSum <- function(x, removeCommon = T){
  list(
    `word count` = wordCount(x),
    `word frequency` = head(wordFreq(x, removeCommon = removeCommon), 10)
  )
}