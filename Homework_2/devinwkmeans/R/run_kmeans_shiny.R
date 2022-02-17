#' Runs the shiny app.
#'
#' I mean, thats about as much explanation as it needs
#'
#' @export
#'

run_kmeans_shiny <- function() {
  appDir <- system.file("clusters_shiny.R", package = "devinwkmeans")
  if (appDir == "") {
    stop("Could not find myapp. Try re-installing `devinwkmeans`.", call. = FALSE)
  }
  
  shiny::runApp(appDir, display.mode = "normal")
}
