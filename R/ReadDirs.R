#' Function to read all the files in the directories
#' 
#' @param d Directory path for the simulations
#' @export

ReadDirs <- function(d){
  dirs <- list.dirs(d, recursive = F)
  Ld <- lapply(dirs, ReadSims)
  names(Ld) <- gsub(d, '', dirs) %>%  gsub('([^A-z])', '', .)
  return(Ld)
}