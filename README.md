
<!-- README.md is generated from README.Rmd. Please edit that file -->

# summarytable

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

\#\#Execution

All code was prepared in RStudio using R version 4.1.0 (2021-05-18) –
"Camp Pontanezen. All files in this repository can be run and modified
using these same programs.

## Example

This is a basic example which shows you how to solve a common problem:

``` r
suppressPackageStartupMessages(library(summarytable))
count_freq_perc(iris, Species, rows = NULL)
#> # A tibble: 3 × 3
#>   Species        n percentage
#>   <fct>      <int>      <dbl>
#> 1 setosa        50       33.3
#> 2 versicolor    50       33.3
#> 3 virginica     50       33.3

#three groups
count_freq_perc(starwars, homeworld, rows = 3)

#all groups with rows specified
count_freq_perc(starwars, homeworld, rows = NULL)

#all groups without rows specified: same result but will throw warning
count_freq_perc(starwars, homeworld)

#all groups are equal so will print all three rows. 
count_freq_perc(PlantGrowth, group, rows = 1)
```
