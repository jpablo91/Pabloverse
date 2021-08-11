#' Function to get a Bivariate table
#' 
#' @param Data A data frame with the variables
#' @param x a string with the name of the variable
#' @param y the name of the response variable
#' @export

BiV.Tbl <- function(Data, x, y){
  D <- Data %>%
    count(eval(parse(text = x)), eval(parse(text = y))) %>%
    group_by(`eval(parse(text = x))`) %>%
    mutate(Proportion=round(n/(sum(n))*100, 2))
  
  names(D)[1:2] <- c(x, y)
  return(D)
}