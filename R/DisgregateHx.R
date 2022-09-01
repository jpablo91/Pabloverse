#' Function to obtain temporal autocorrelation
#' 
#' @param shp The shapefile with the variable to convert to a grid
#' @param Hx The hexagonal grid shapefile, must be same crs than the shapefile
#' @param field The name of the field that want to obtain
#' @param fun A function to apply to summarise the values
#' @param res the resolution of the raster used to summarise the poligons
#' @export

DisgregateHx <- function(shp, Hx, field, fun = 'max', res = 1000) {
  # Create an empty raster (increaseing the ncol and nrow will give us a better resolution, but will also increase the computation time)
  r <- raster(ncol = res, nrow = res)
  crs(r) <- crs(Hx)
  # Set the extent same as the shapefile
  extent(r) <- extent(Hx)
  # Rasterize the data with fasterize (its faster tahn rasterize)
  r <-fasterize::fasterize(sf = shp, raster = r, field = field, fun = fun)
  # summarise raster values per hexagon
  Vals <- lapply(seq_len(nrow(Hx)), function(x) {
    mean(raster::extract(r, Hx[x, ])[[1]], na.rm = TRUE)
  }) %>%
    do.call(rbind, .)
}