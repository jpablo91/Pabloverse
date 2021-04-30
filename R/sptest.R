#' Function to get the shappiro test p value
#' 
#' @param x A vector of values
#' @export

sptest <- function(x, na.rm){
  shapiro.test(x)$p.value %>% round(., 4) %>%
    ifelse(. < 0.01, "<0.01", .)
}