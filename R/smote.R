#' Synthetic Minority Oversampling with SMOTE
#'
#' @param data The dataframe or tibble you wish to oversample
#' @param var The target class variable to be over sampled - must be a string
#' @param prop The proportion of minority to majority observations you wish to have after resampling - defaults to 1
#'
#' @keywords smote
#' @example
#' iris %>% smote(Species)
#'
#' @export

smote = function(data, var, prop = 1){

  formula = as.formula(paste(var, "~ ."))
  data = recipes::recipe(formula, data = data) %>%
    themis::step_smote(recipes::all_outcomes(), over_ratio = prop) %>%
    recipes::prep() %>%
    recipes::bake(new_data = NULL)

  return(data)
}
