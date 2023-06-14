#' Function to get the word frequency in a string of text
#' 
#' @param x string of text to count
#' @param remmoveCommon Remove the common words (i.e. 'a', 'are', 'the', ...)
#' @export
#' 
wordFreq <- function(x, removeCommon = T){
  if(removeCommon){
    common <- c('a', 'are', 'the', 'by', 'of', 'and', 'in', 'for', 'to', 'is', 'i', 'we', 'he', 'they', 'you', 'on', 'or')
  }else{
    common <- c('')
  }
  data.frame(word = strsplit(x, ' ')[[1]]) %>%
    mutate(word = tolower(word)) %>%
    count(word, sort = T) %>%
    filter(!(word %in% common)) %>%
    mutate(`p (%)` = round(100*(n/sum(n)), 3))
}