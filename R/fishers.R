#' Function to obtain a Fisher's exact table
#' 
#' @param data The name of the data frame
#' @param x Name of variable
#' @param y Name of respose variable
#' @param outcome Type of outcome to return, options are 'figure' and 'table'
#' @param offset spacing between the mosaic in the figure
#' @param pal color palette for the figure. Must provide two or more colors, function automatically interpolates between colors if number of colors provided less than levels of y variable
#' @export
#' 
fishers <- function(data, x, y, offset = 0.01, outcome = 'figure', pal = c('orchid3', 'seagreen3')){
  # x = 'repPPE'; y = 'ASF' # Variables for testing the function
  d <- data %>%
    select(x = x, y = y)
  ncol <- length(levels(factor(d$y)))
  # Get the fishers exact test ---------------
  test <- xtabs(~eval(parse(text = x)) + eval(parse(text = y)), 
                data = data) %>% fisher.test()
  
  Pval <- round(test$p.value, 2) # estimate p value --------
  CI <- test$conf.int # estimate confidence intervals --------
  CI <- paste(round(CI, 2), collapse = ", ") # Format CI
  Estimate <- round(test$estimate, 2) # Get the point estimate
  
  # Make a figure ------------
  p <- ggplot() +
    ggmosaic::geom_mosaic(data = d, aes(x=ggmosaic::product(x, y),fill = y), offset = offset) +
    scale_fill_manual(values = Pabloverse::pablette(ncol, pal = pal)) +
    labs(title = paste0(y, ' ~ ', x), subtitle = paste0('Estiamte: ', Estimate, '(', CI, ')', '\n p-value: ', Pval),
         x = x, y = y, fill = y) +
    coord_equal() +
    theme(
      panel.background = element_blank(), 
      plot.subtitle = element_text(size = 8)
    )
  
  # Make the table -------------
  DF <- data.frame(Estimate, CI, Pval, row.names = x)
  
  # Output -----------
  if(outcome == 'figure'){
    p
  }else if(outcome == 'table'){
    DF
  }
}