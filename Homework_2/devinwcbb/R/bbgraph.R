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
    
    data$team_score <- ifelse(data$home == team, data$score1, data$score2)
    
    data$opponent_score <- ifelse(data$home == team, data$score2, data$score1)
    
    data %>% ggplot(aes(x = team_score, y = opponent_score)) + 
      geom_point(size = 5) + geom_abline() +
      labs(x = paste(team, "Score"), y = "Opponent Score", title = paste(team, "Basketball Scores"))
  }
  
}