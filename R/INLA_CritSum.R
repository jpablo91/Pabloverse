#' Function to summarise criteria from an INLA model
#' 
#' @param x INLA model to summarise
#' @export
INLA_CritSum <- function(x) {
  d <- data.frame(Model = deparse(substitute(x)), 
                  DIC = x$dic[1], 
                  WAIC = x$waic[1], 
                  CPO = -sum(log(x$cpo$cpo)), 
                  MLIK = x$mlik[1])
  return(d)
}