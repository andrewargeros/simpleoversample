#' Synthetic Minority Oversampling with SMOTE
#'
#' @param data The dataframe or tibble you wish to oversample
#' @param var The target class variable to be over sampled - must be a string
#' @param prop The proportion of minority to majority observations you wish to have after resampling - defaults to 1
#'
#' @keywords smote
#' @example
#' penguins %>% smote(species)
#'
#' @export

smote = function(data, var, prop = 1){
  if (sum(is.na(data)) > 0){
    rlang::abort("SMOTE cannot handle NA values. Try using tidyr::drop_na() or tidyr::replace_na()")
  }

  formula = as.formula(paste(var, "~ ."))
  data = recipes::recipe(formula, data = data) %>%
    recipes::step_rm(recipes::all_nominal_predictors()) %>%
    themis::step_smote(recipes::all_outcomes(), over_ratio = prop) %>%
    recipes::prep() %>%
    recipes::bake(new_data = NULL)

  return(data)
}
