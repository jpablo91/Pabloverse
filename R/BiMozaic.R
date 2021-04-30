#' Function to get a univariate mozaic plot
#' 
#' @param Data A data frame with the variables
#' @param x a string with the name of the variable
#' @param y a string of the name of response variable
#' @param palette color palette for the plot
#' @export

BiMozaic <- function(Data, x, y, palette="Set1"){
  # Compute a p value
  Pval <- xtabs(~eval(parse(text = x))+eval(parse(text=y)), data=Data) %>%
    fisher.test() %>%
    .$p.value
  Pval <- ifelse(Pval < 0.01, "<0.01*", round(Pval, 2))
  # make the plot
  Data %>%
    count(eval(parse(text = x)), eval(parse(text = y))) %>%
    mutate(Index = paste(`eval(parse(text = y))`, n, sep = '\n')) %>%
    # rename(x = `eval(parse(text = x))`) %>%
    treemap(., index = c('eval(parse(text = x))', "Index"), 
            vSize = 'n', type = 'index', 
            title = paste('Distribution by', x, ' and', y, '(p = ', Pval, ')'), 
            palette = "Set1", border.lwds = c(8, 1), border.col = c('grey10', 'grey70'))
}