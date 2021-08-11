#' Function to obtain a Fisher's exact table
#' 
#' @param Data The name of the data frame
#' @param x Name of variable
#' @param y Name of respose variable
#' @export
#' 
FishersTbl <- function(Data, x, y){
  test <- xtabs(~eval(parse(text = x))+eval(parse(text=y)), data=Data) %>%
    fisher.test()
  
  Pval <- round(test$p.value, 2)
  CI <- test$conf.int
  Estimate <- round(test$estimate, 2)
  
  DF <- data.frame(Estimate, CI = paste(round(CI, 2), collapse = ", "), Pval, row.names = x)
  
  return(DF)
}