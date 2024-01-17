#' Function to generate coordinates in a 2D grid
#' 
#' @param data a dataset where each row will have a coordinate in a 2d plane assigned
#' @param w Name of the variable used to generate the coordinates
#' @param order order of the arrangement
#' @export
#' 
grid_coords <- function(data, w, order = "ordered"){
  
  max_rank <- data %>% pull({{w}}) %>% length()
  
  data %>% 
    mutate(
      rank = rank({{w}}, ties.method = "first"),
      random = sample(1:length({{w}}), n())
    ) %>% rowwise() %>% 
    mutate(r = ifelse(order == "ordered", rank, random)) %>% 
    data.frame() %>%
    mutate(
      # Adjust ranks to start again at 1 when the max value is reached
      adjusted_ranks = r %% max_rank,
      adjusted_ranks = ifelse(adjusted_ranks == 0, max_rank, adjusted_ranks),
      num_rows = ceiling(sqrt(max_rank)),
      num_columns = ceiling(sqrt(max_rank)),
      row = ((adjusted_ranks - 1) %/% num_columns) + 1,
      col = (adjusted_ranks - 1) %% num_columns + 1
    ) %>% 
    select(-adjusted_ranks, -rank, -random, -r, -num_columns, -num_rows)
}