#' Custom theme function
#' 
#' @param bg color of the panel backgound
#' @param grid color of the grid
#' @param axis boolean, whether or not to include the axis
#' @param legend.position legend position, option include: 'top', 'bottom', 'left', 'right', and 'none'
#' @export
#' 

theme_map <- function(bg = "#E0F0FF", grid = "#00000010", axis = T, legend.position = "right"){
if(axis){
  a <- element_text()
  at <- element_line()
}else{
  a <- element_blank()
  at <- element_blank()
}

theme(
  panel.border = element_rect(fill = NA, colour = "black"),
  panel.background = element_rect(fill = bg),
  panel.grid = element_line(colour = grid),
  axis.text = a,
  axis.ticks = at,
  legend.position = legend.position
)
} 