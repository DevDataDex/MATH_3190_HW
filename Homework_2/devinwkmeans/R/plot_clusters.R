#' Plots two-dimensional clusters
#'
#' Takes two column vectors with their associated clusters and plots them
#' on a standard dot plot. Also plots the centers of each cluster.
#'
#' @param cols The columns to be plotted
#' @param kmeans Result of the kmeans algorithm
#'
#' @return plot
#' 
#' @export
#'

plot_clusters <- function(cols, kmeans){
  plot(cols,
       col = kmeans$cluster,
       pch = 20, cex = 3)
  points(kmeans$centers, pch = 4, cex = 4, lwd = 4)
}