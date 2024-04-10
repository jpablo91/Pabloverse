#' Function to get the shappiro test p value
#' 
#' @param data dataset
#' @param x name of the variable
#' @param col color for the fill
#' @param main Main title for the figure
#' @export

plot_cat <- function(x, data, col = "red4", main = NULL, stratified = F, st, n_sort = F, xlab = "", ylab = ""){
  if(is.null(main)){
    l <- select(data, {{x}}) %>% names() 
  }else{
    l <- main
  }
  if(stratified){
    p <- data %>% 
      count({{x}}, {{st}}) %>%
      group_by({{st}}) %>% 
      mutate(p = round(100 * n/sum(n), 2)) %>% 
      # ggplot(aes(x = p, y = ifelse(n_sort, reorder({{x}}, p), {{x}}))) +
      ggplot(aes(x = p, y = reorder({{x}}, p))) +
      geom_bar(aes(fill = {{st}}), stat = "identity", position = "dodge", colour = "black") +
      geom_label(aes(label = paste(p, "%"), col = {{st}}), alpha = 0.8, size = 3) +
      labs(title = l, y = ylab, x = xlab) +
      # scale_fill_manual(values = c("#A08000", "#A00000")) +
      # scale_color_manual(values = c("#A08000", "#A00000")) +
      theme_bw()
  }else{
    p <- data %>% 
      count({{x}}) %>%
      mutate(p = round(100 * n/sum(n), 2)) %>% 
      # ggplot(aes(x = p, y = ifelse(n_sort, reorder({{x}}, p), {{x}}))) +
      ggplot(aes(x = p, y = reorder({{x}}, p))) +
      geom_bar(stat = "identity", position = "dodge", fill = col, colour = "black") +
      geom_label(aes(label = paste(p, "%")), alpha = 0.8, size = 3) +
      labs(title = l, y = ylab, x = xlab) +
      theme_bw()
  }
  
  p
}