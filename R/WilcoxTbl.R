#' Function to obtain a wilcoxon rank table
#' 
#' @param Data The name of the data frame
#' @param x Name of variable
#' @param y Name of respose variable
#' @export

WilcoxTbl <- function(Data, x, y){
  test <- wilcox.test(eval(parse(text=x))~eval(parse(text=y)), data = Data, conf.int = T)
  
  Pval <- round(test$p.value, 2)
  CI <- test$conf.int
  Estimate <- round(test$estimate, 2)
  
  DF <- data.frame(Estimate, CI = paste(round(CI, 5), collapse = ", "), Pval, row.names = x)
  
  return(DF)
}