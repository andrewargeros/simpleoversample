# simpleoversample
A Simple Framework for Oversampling Imbalanced Tibbles

This package currently contains only two functions to oversample imbalanced datasets. It was developed for Brett Devine's QMBE 3740 - Data Mining at Hamline University to be a simple wrapper for oversampling without teaching the complexities of [Tidymodels](https://www.tidymodels.org/) and the [Tidyverse](https://www.tidyverse.org/)

## `random_oversample()`
This function will randomly duplicate minority rows from a tibble with replacement, and append to the original.

### Example
On [Palmer Penguins](https://allisonhorst.github.io/palmerpenguins/)

```r
penguins_over = penguins %>% random_oversample(Species)
```

## `smote()`
This function applies the SMOTE synthetic minority oversampling algorithm to balance classes using artificially generated data

### Example
On [Palmer Penguins](https://allisonhorst.github.io/palmerpenguins/)

```r
penguins_smote = penguins %>% smote(Species)
```
