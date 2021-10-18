#' Randomly Oversample Minority Class in Dataframes
#'
#' @param data The dataframe or tibble you wish to oversample
#' @param var The target class variable to be over sampled
#' @param prop The proportion of minority to majority observations you wish to have after resampling - defaults to 1
#'
#' @keywords random_oversample
#' @example
#' iris %>% random_oversample(Species)
#'
#' @export

random_oversample <- function(data, var, prop = 1){
  needed = data %>%
    dplyr::count(var) %>%
    dplyr::mutate(needed = max(n) - n) %>%
    dplyr::filter(needed > 0)

  for (i in needed$var){
    num_needed = needed %>%
      dplyr::filter(var == i) %>%
      dplyr::select(needed) %>%
      as.numeric()

    over_rows = data %>%
      dplyr::filter(var == i) %>%
      dplyr::sample_n(num_needed*prop, replace = T)

    data = data %>% dplyr::bind_rows(over_rows)
  }
  return(data)
}
