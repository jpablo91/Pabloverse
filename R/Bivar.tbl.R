#' Function to get a univariate mozaic plot
#' 
#' @param Data A data frame with the variables
#' @param x a string with the name of the variable
#' @param y a string of the name of response variable
#' @param as_kable Is the outcome table a kable format?
#' @export

Bivar.tbl <- function(Data, x, y, as_kable = F){
  D <- Data %>%
    count(eval(parse(text=y)), eval(parse(text=x))) %>%
    group_by(`eval(parse(text = y))`) %>% mutate(Proportion = round(n/sum(n), 2)) 
  colnames(D)[1:2] <- c(y, x)
  if(as_kable){
    D %>% knitr::kable()
  } else{
    return(D) 
  }
}