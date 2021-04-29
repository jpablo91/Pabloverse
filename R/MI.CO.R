#' Function to obtain pseudo p-values for Morans I
#' 
#' @param x A spatial object of type sf
#' @param var The name of a variable from the spatial object which will be used to the Moran's I
#' @param nsim Number of simulations
#' @export

MI.CO <- function(x, var, nsim = 1000){
  # Get adjacency mat
  wl <- poly2nb(x, queen = T) %>%
    nb2listw(., style = "B")
  # Create lag and standardize variable
  x <- x %>%
    mutate(sVar = scale(eval(parse(text = var))), # Standardize the variable
           lag = lag.listw(wl, eval(parse(text = var))), # create a lagged variable
           slag = lag.listw(wl, sVar)) # Should the lagged variable be standardized ??
  
  x <- x %>% 
    mutate(pval = Local.MI.MC(Data = eval(parse(text = var)), N_simulations = nsim, wl = wl),
           COType = ifelse((sVar >= 0 & slag >= 0) & pval <= 0.05, 'HH', NA),
           COType = ifelse((sVar <= 0 & slag <= 0) & pval <= 0.05, 'LL', COType),
           COType = ifelse((sVar >= 0 & slag <= 0) & pval <= 0.05, 'HL', COType),
           COType = ifelse((sVar <= 0 & slag >= 0) & pval <= 0.05, 'LH', COType))
  return(x)
}