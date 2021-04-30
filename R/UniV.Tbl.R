#' Function to get a univariate table
#' 
#' @param Data A data frame with the variables
#' @param x a string with the name of the variable
#' @param type "categorical" or "continous" depending on the type of variable
#' @export

UniV.Tbl <- function(Data, x, type = "categorical"){
  if(type == "categorical"){
    D <- Data %>%
      count(eval(parse(text = x))) %>%
      mutate(Proportion=round(n/(sum(n))*100, 4))
    
    names(D)[1] <- x
  } else if (type == "continous"){
    D <- Data %>%
      mutate(Variable = x) %>%
      group_by(Variable) %>%
      summarise_at(.vars = x, .funs = c(mean, median, min, max, sptest, NA.count), na.rm = T) %>%
      mutate_at(.vars = c('fn1', 'fn3', 'fn6'), .funs = ~round(., 2)) %>%
      rename(mean = fn1, median = fn2, min = fn3, max = fn4, ShapiroTest = fn5, NA_p = fn6)
  }
  
  return(D)
}