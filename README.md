# simpleoversample
A Simple Framework for Oversampling Imbalanced Tibbles

This package currently contains only three functions to oversample imbalanced datasets. It was developed for Brett Devine's **QMBE 3740 - Data Mining at Hamline University** to be a simple wrapper for oversampling without teaching the complexities of [Tidymodels](https://www.tidymodels.org/) and the [Tidyverse](https://www.tidyverse.org/)

## Installation

This package is not on CRAN, so it can be installed via:

```r
devtools::install_github('andrewargeros/simpleoversample')
```

## `random_oversample()`
This function will randomly duplicate minority rows from a tibble or dataframe with replacement, and append to the original. The proportion of minority:majority observations can be controlled using the `prop` parameter.


## `smote()`
This function applies the SMOTE synthetic minority oversampling algorithm to balance classes using artificially generated data. Note: SMOTE can only handle numeric data, and this function will remove any non-numeric predictor columns.

## `adasyn()`

This function is roughly the same as the SMOTE algorithm, but applies a density distribution to generate more realistic data as presented in [He et. al (2008)](https://sci2s.ugr.es/keel/pdf/algorithm/congreso/2008-He-ieee.pdf)

## Example
These examples use the  [Palmer Penguins](https://allisonhorst.github.io/palmerpenguins/) dataset

```r
library(tidyverse)
pens = palmerpenguins::penguins
pens %>% count(species) # Baseline- Note the imbalance

  #   A tibble: 3 × 2
  #   species	n
  #   <fct>	<int>
  #   Adelie	152
  #   Chinstrap	68
  #   Gentoo	12

library(simpleoversample)
pens %>%
  drop_na() %>%
  smote('species') %>%
  count(species)

  #   A tibble: 3 × 2
  #   species	n
  #   <fct>	<int>
  #   Adelie	146
  #   Chinstrap	146
  #   Gentoo	146  

# Using Random Oversampling

pens %>%
  random_oversample('species') %>%
  count(species)

  #   A tibble: 3 × 2
  #   species	n
  #   <fct>	<int>
  #   Adelie	152
  #   Chinstrap	152
  #   Gentoo	152    
```
