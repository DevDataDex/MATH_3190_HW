#' Creates a graph of the basketball data
#'
#' Give a better description of what the graph is as soon as you decide the
#' final product of what the graph will look like.
#'
#' @param data tibble
#' @param team character
#'
#' @return ggplot2
#'
#' @export
#'

bbgraph <- function(data, team = NULL) {
  if (is_null(team)) {
    g <- data %>% ggplot(aes(x = score1, y = score2))
    g + geom_point() + labs(x = "Home Score", y = "Visiting Score",
                            title = "Basketball Scores")
  } else{
    data <- data %>% team_filter(team)
    data$ishome <- as.factor(ifelse(data$home == team, 1, 0))
    g <- data %>% ggplot(aes(x = score1, y = score2, col = ishome))
    g + geom_point() + geom_abline() + labs(
      x = "Home Score",
      y = "Visiting Score",
      title = cat(team, "Basketball Scores")
    )
  }
  
}