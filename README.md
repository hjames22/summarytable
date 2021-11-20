
<!-- README.md is generated from README.Rmd. Please edit that file -->

# summarytable

<!-- badges: start -->
<!-- badges: end -->

The goal of summarytable is to enable users to create simple summary
tables of the frequency of non-numeric variables in a data set with both
the count and proportion of total variables. This package was created to
complete the requirements for assignment B2 of STAT 545B at UBC.

## Installation

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("hjames22/summarytable")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(Function)
count_freq_perc(iris, Species)
#> # A tibble: 3 × 3
#>   Species        n percentage
#>   <fct>      <int>      <dbl>
#> 1 setosa        50       33.3
#> 2 versicolor    50       33.3
#> 3 virginica     50       33.3
```
