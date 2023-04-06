#' Function to read the simulations
#' 
#' @param d Directory path for the simulations
#' @export

ReadSims <- function(d) {
  f <- list.files(d, full.names = T)
  D <- lapply(f, function(x) {
    read.csv(x)
  }) %>%
    do.call(rbind, .)
  return(D)
}