#' Function to get RF CART plots 
#' 
#' @param data dataset used
#' @param f formula for the RF
#' @param main Title used for the plots
#' @param seed seed used for replication of results
#' @export

RFCART <- function(data, f, main = '', seed = 1){
  set.seed(seed)
  # Split the data train/test
  ind <- sample(2, nrow(data), replace = TRUE, prob = c(0.7, 0.3))
  train <- data[ind==1,]
  test <- data[ind==2,]
  # Random Forest model fit
  rf <- randomForest::randomForest(f, data=train, proximity=TRUE) 
  print(rf)
  # Variable importance
  P1 <- importance(rf) %>%
    data.frame() %>% 
    mutate(variable = rownames(.), RelImpt = IncNodePurity/sum(IncNodePurity)) %>%
    ggplot(aes(x = reorder(variable, RelImpt), y = RelImpt)) +
    geom_col() +
    coord_flip() +
    labs(x = 'Parameters', y = 'Relative Importance', title = main) +
    theme_light()
  
  # tr <- tree::tree(f, data=data)
  # plot(tr); text(tr)
  fit <- rpart(f, data=data)
  rpart.plot::rpart.plot(fit, type = 5)
  
  return(P1)
}