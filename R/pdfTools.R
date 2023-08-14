#' Function to run the pdf tools 
#' @export
pdfTools <- function() {
  appDir <- system.file("shiny", "pdfTool", package = "Pabloverse")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `Pabloverse` or contact jpgo@ucdavis.edu for support.", call. = FALSE)
  }
  
  shiny::runApp(appDir, display.mode = "normal")
}