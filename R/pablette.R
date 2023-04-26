#' Function to get a color palette
#' 
#' @param n number of colors to get
#' @param pal palette used, this can be either a vector of colors or a predefined palette
#' @param type type of palette, only 'cat' is implemented
#' @export

pablette <- function(n, pal, type = 'cat'){
  ## palettes
  pals <- list(
    ca = c('#AF2B45', '#F2F2F2', '#3D8A47', '#56452E', '#B68666'),
    fett = c('#999f91', '#596358', '#4c5936', '#704D3A', '#6A2E26'),
    glacier = c('#99B6d6', '#2D5870', '#617273'),
    tr808 = c('#F1F827', '#F8A125', '#E72E2E', '#202020'),
    tr909 = c('#F2F2F2', '#BCC0B8', '#CF9852', '#9B562C', '#50514E'),
    linn = c('#201D24', '#9C5E45', '#543530', '#6B3730')
  )
  
  if(length(pal) == 1){
    pal <- unlist(pals[names(pals) == pal])
  }else{
    pal <- pal
  }
  
  if(type =='cat'){
    grDevices::colorRampPalette(colors = pal)(n) 
  }
}