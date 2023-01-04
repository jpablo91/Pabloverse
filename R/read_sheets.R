#' Function to read all the sheets from an excel file into a list
#' 
#' @param f the path of the file
#' @export

read_sheets <- function(f){
  sheets <- readxl::excel_sheets(f) # Get sheet names
  lapply(sheets, readxl::read_xlsx, path = f) %>% # read all the sheets in a list
    `names<-`(sheets) # Rename the list elements with the sheets names
}