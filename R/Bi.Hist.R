#' Function to get a univariate mozaic plot
#' 
#' @param Data A data frame with the variables
#' @param Var a string with the name of the variable
#' @param y a string of the name of response variable
#' @export

Bi.Hist <- function(Data, Var, y){
  # Get p-val
  Pval <- wilcox.test(eval(parse(text=Var))~eval(parse(text=y)), data = Data) %>%
    .$p.value
  
  Pval <- ifelse(Pval < 0.01, "<0.01*", round(Pval, 4))
  
  Data %>%
    ggplot()+
    geom_histogram(aes(eval(parse(text=Var)), fill =factor(eval(parse(text=y)))), alpha = 0.5) +
    xlab(Var)+
    scale_fill_discrete(name = y, labels = c("No", "Yes")) +
    ggtitle(paste('Distribution by', Var, ' and', y, '(p = ', Pval, ')')) +
    theme_minimal()
}