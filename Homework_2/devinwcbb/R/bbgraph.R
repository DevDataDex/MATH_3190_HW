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
    data$Location <- as.factor(ifelse(data$home == team, "Home", "Visitor"))
    data$Won <- as.factor(ifelse(((data$home == team) & (data$score_diff > 0)) | ((data$vis == team) & (data$score_diff < 0)),"Won","Loss"))
    data %>% ggplot(aes(x = score1, y = score2, col = Won)) + 
      geom_point(aes(shape = Location), size = 5) + geom_abline() +
      labs(x = "Home Score", y = "Visiting Score", title = paste(team, "Basketball Scores"))
  }
  
}