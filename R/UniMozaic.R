#' Function to get a univariate mozaic plot
#' 
#' @param data A data frame with the variables
#' @param x a string with the name of the variable
#' @param palette color palette for the plot
#' @export

UniMozaic <- function(data, x, palette="Set1"){
  data %>%
    count(eval(parse(text = x))) %>%
    mutate(Index = paste(`eval(parse(text = x))`, n, sep = '\n')) %>%
    treemap::treemap(., index = "Index", vSize = 'n', type = 'index', title = paste('Distribution by', x), palette = "Set1")
} 