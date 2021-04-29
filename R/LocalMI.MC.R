#' Function to obtain pseudo p-values for Morans I
#' 
#' @param Data A vector of continous values that represent the value at each location
#' @param wl The adjacency matrix
#' @param N_simulations Number of simulations
#' @export

LocalMI.MC <- function(Data, N_simulations, wl){
  # Data = x$total; wl = wl; N_simulations = 100
  MI.Test <- localmoran(Data, wl) %>% 
    data.frame()
  I <- MI.Test$Ii
  n <- length(Data)
  #Create 1 x n matrix with each column being a polygon and the first row the I statistic for observed data
  Ii <- t(I)
  # Make a loop for the simulations:
  for(i in 1:N_simulations){
    i <- 1
    # Randomly sample from the observed data
    S <- sample(1:n, n, replace = F)
    # Assign the sampled values randomly to other features:
    DataS <- Data[S]
    # Run a Moran's I for the generated data:
    Iij <- localmoran(DataS, wl)[,1]
    # Add a row for each I calculated for the simulated data
    Ii <- rbind(Ii, Iij)
  }
  # Make a loop for calculating p values:
  p <- vector(length = n)
  # make a for loop for calculating pseudo p-val
  for(i in 1:ncol(Ii)){
    # calculate proportion of simulated Is greater than observed:
    p[i] <-  (sum(abs(Ii[-1,i]) >= abs(I[i]))) / (N_simulations + 1)
  }
  return(p)
}