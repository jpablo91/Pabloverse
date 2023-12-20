#' This function will take a vector of strings and provide a data frame of the similarity between pair of the elements inside the given vector
#' 
#' @param x vector of strings to make the pairwise comparisons
#' @param th threshold used for the analysis. values above the threshold will be provided in the output data frame
#' @export
#' 

similarity_test <- function(x, th = 0.5){
  t(combn(x, 2)) %>% 
    data.frame() %>% 
    filter(X1 != X2) %>% 
    mutate(similarity = stringdist::stringsim(X1, X2)) %>% 
    arrange(-similarity) %>% 
    filter(similarity > th)
}