#' Function to get a color palette
#' 
#' @param n number of colors to get
#' @param pal palette used, this can be either a vector of colors or a predefined palette, options include: 'ca', 'paperplane', 'lot', 'illumination' 'fett', 'glacier', 'hamza', 'retro', 'calico', 'tr808', 'linn', 'endor', 'tatooine'
#' @param type type of palette, only 'cat' is implemented
#' @export

pablette <- function(n, pal, type = 'cat'){
  ## palettes
  pals <- list(
    ca = c('#AF2B45', '#F2F2F2', '#3D8A47', '#56452E', '#B68666'),
    paperplane = c('#B74643', '#FBD576', '#3DA770'),
    lot = c('#D87335', '#DFAAAD', '#358232', '#13743B', '#A47BCB'),
    illumination = c('#EA706B', '#F27A9B', '#695B9D', '#DDDDDD'),
    fett = c('#999f91', '#596358', '#4c5936', '#704D3A', '#6A2E26'),
    tatooine = c('#6C442A', '#A68562', '#F2ECD2', '#EE8465', '#BDB0CB'),
    endor = c('#4A590E', '#C3D77C', '#262319', '#7D735D', '#BA4422'),
    glacier = c('#99B6d6', '#2D5870', '#617273'),
    tr808 = c('#F1F827', '#F8A125', '#E72E2E', '#202020'),
    tr909 = c('#F2F2F2', '#BCC0B8', '#CF9852', '#9B562C', '#50514E'),
    linn = c('#201D24', '#9C5E45', '#543530', '#6B3730'),
    pal1 = c('#6A2566', '#448BA3', '#E9B940', '#F2E1DA', '#DF422E'),
    mx = c('#006341', '#FFFFFF', '#C8102E'),
    ecu = c('#FFD100', '#0072CE', '#EF3340'),
    ban = c('#F42A41', '#006A4E'),
    tt = c('#C8102E', '#000000', '#FFFFFF'),
    hamza = c("#FF8AC6", 'grey95', "grey50", "grey20", "#D1D160"),
    calico = c('#ffffff', '#000000', '#eb9414', '#ff7a00'),
    retro = c('#666547', '#fb2e01', '#6fcb9f', '#ffe28a', '#fffeb3')
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