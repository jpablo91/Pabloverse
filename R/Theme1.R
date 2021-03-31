#' Function for custom theme
#' @export

Theme1 <- function(){
  ggplot2::theme_light() +
    ggplot2::theme(
      axis.ticks = ggplot2::element_blank(),
      strip.background = element_rect(fill = '#435E42', color = 'black'),
      strip.text = element_text(color = 'grey90')
    )
}