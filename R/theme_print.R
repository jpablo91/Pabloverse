#' Function for custom theme
#' @param fill color for the fill of the panel
#' @param border color of the border
#' @export


theme_print <- function(fill = NA, border = 'grey50'){
  if(is.na(fill)){
    fill <- rainbow(n = 1, s = 0.3, v = 0.6, start = runif(1, 0.01, 0.99))
  }
  
  ggplot2::theme(plot.background = element_rect(fill = border),
                 panel.background = element_rect(fill = fill),
                 panel.border = element_blank(),
                 panel.grid = element_blank(),
                 axis.text = element_blank(),
                 axis.ticks = element_blank(), 
                 plot.title = element_text(colour = 'grey90', face = 'bold.italic', size = 16, hjust = 0.5))
}