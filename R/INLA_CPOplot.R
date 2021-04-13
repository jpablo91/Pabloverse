#' Function to summarise criteria from an INLA model
#' 
#' @param m INLA model to summarise
#' @export
INLA_CPOplot <- function(m){
  d <- data.frame(Model = deparse(substitute(m)), CPO = m$cpo$cpo, PIT = m$cpo$pit) %>% 
    mutate(Observation = 1:n()) %>%
    tidyr::gather(type, value, CPO,PIT) %>% 
    ggplot() +
    geom_point(aes(Observation, y = value), alpha = 0.7) +
    facet_wrap(~type)
  return(d)
}