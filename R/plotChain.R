#' Function to plot a MCMC chain from simulated data
#' 
#' @param df the data frame with the simulation outcomes
#' @param var A string with the name of the variable to plot
#' @param col color of the line to plot
#' @param lwd line width for the plot
#' @export

plotChain <- function(df, var, col = 'black', lwd = 0.7, title = '', x = 'N simulations', y = 'x'){
  # df = s$Cum; var = 'TotalInfected'
  d <- sapply(1:nrow(df), function(x){
    df %>% 
      slice(sample(size = x, 1:n())) %>% 
      pull(!!(var)) %>% 
      mean()
  }) %>% 
    data.frame(n = 1:nrow(df), x = .) 
  d %>% 
    ggplot() +
    geom_line(aes(x = n, y = x), col = col, lwd = lwd) +
    geom_hline(yintercept = tail(d, 1) %>% pull(x), col = 'red3', lty = 2) +
    theme_minimal() +
    labs(title = title, x = x, y = y)
}