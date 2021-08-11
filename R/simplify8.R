#' Function to standardize the Names ####
#' 
#' @param x A string to simplify
#' @export

simplify8 <- function(x){
  x %>% 
    toupper() %>% # Make all uppercaps
    gsub("Ñ", "N",.) %>% # remove ñ
    iconv(from = "UTF-8", to = "ASCII//TRANSLIT")%>% # remove accents
    gsub(pattern = "\\s*\\([^\\)]+\\)", replacement = "", x = .) # Remove other special characters and parenthesis
}