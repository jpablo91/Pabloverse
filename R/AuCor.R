#' Function to obtain temporal autocorrelation
#' 
#' @param x A vector of values
#' @param l The lag used to investigate the Autocorrelation
#' @export

AuCor <- function(x, l){
  y <- acf(x, pl = F, lag.max = l)
  y <- y[[1]][l]
  return(y)
}