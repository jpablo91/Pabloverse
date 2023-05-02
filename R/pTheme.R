#' Custom theme function
#' 
#' @param dark boolean, for dark color palettes
#' @param axis boolean, whether or not to include axes
#' @param grid boolean, whether or not to include the grid
#' @param legend legend position, option include: 'top', 'bottom', 'left', 'right', and 'none'
#' @export

pTheme <- function(dark = T, axis = T, grid = T, legend = 'bottom'){
  gr <- paste0('grey', seq(10, 90, by = 10))
  pal <- ifelse(dark, rev(gr), gr)
  # ax <- ifelse(axis, element_text(colour = pal[1]), element_blank())
  theme(
    text = element_text(colour = pal[1]),
    panel.background = element_rect(colour = pal[1], fill = NA),
    plot.title = element_text(colour = pal[1], face = 'bold', size = 18),
    plot.background = element_blank(),
    panel.border = element_rect(fill = NA, colour = pal[2]),
    axis.ticks = element_blank(),
    panel.grid.major = element_line(colour = ifelse(grid, alpha(pal[1], alpha = 0.3), NA)),
    panel.grid.minor = element_line(colour = ifelse(grid, alpha(pal[1], alpha = 0.3), NA), linewidth = 0.1),
    # axis.title.y = element_text(colour = pal[2]),
    strip.background = element_rect(fill = 'grey80'),
    strip.text = element_text(colour = 'grey30'),
    axis.text = element_text(colour = ifelse(axis, pal[1], NA)),
    legend.position = legend
  )
}