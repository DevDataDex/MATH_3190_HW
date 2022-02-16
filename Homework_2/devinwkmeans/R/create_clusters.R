#' Creates clustering of data
#'
#' Takes columns and number of clusters. Runs the basic R kmeans 
#' function and returns the output. 
#'
#' @param cols Columns (fields) of a data frame
#' @param num Number of clusters
#'
#' @return kmeans
#'
#' @export
#' 

create_clusters <- function(cols,num){
  kmeans(cols, num)
}
