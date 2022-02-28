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
  data %>% 
    filter(home == team | vis == team)[,1:5]
}
