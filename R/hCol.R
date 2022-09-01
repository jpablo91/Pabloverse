#' Function for color based on Hue, Brightness and Sat
#' 
#' @param h Hue, Value in the range 0,1
#' @param b Brightness
#' @param s Saturation
#' @export

hCol <- function(h, b, s){
  hc <- rainbow(n = 1, s = s, v = b, start = h)
  return(hc)
}