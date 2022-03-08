#' Filters the kenpom data by given team.
#'
#' Asked in the homework as part of Question 3d. Uses the filter function
#' to filter for a given team whether they were the home or visiting team.
#'
#' @param data A tibble, preferably the kenpom data
#' @param team A string, the team to filter for
#'
#' @return tibble
#'
#' @export
#'
#' @examples
#' team_filter(get_cbb_data(), "Southern Utah")
#' team_filter(get_cbb_data(), "Northern Arizona")
#' 
#' 
team_filter <- function(data, team) {
    x <- filter(data, home == team | vis == team)
    x$Opponent <- ifelse(x$home == team, x$vis, x$home)
    x$`Team Score` <- ifelse(x$home == team, x$score1, x$score2)
    x$`Opponent Score` <- ifelse(x$home == team, x$score2, x$score1)
    x$`Score Difference` <- x$`Team Score` - x$`Opponent Score`
    x$Date <- x$date
    x$Location <- x$location
    x[,c("Date","Opponent", "Team Score", "Opponent Score", "Location", "Score Difference")]
}
