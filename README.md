
<!-- README.md is generated from README.Rmd. Please edit that file -->

# coa

coa introduces compound assignment operators

## Installation

You can install the development version of coa using:

``` r
devtools::install_github("git@github.com:Noza23/coa.git")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(coa)
x <- 10
print(x %+=% 1)
#> [1] 11
print(x %-=% 5)
#> [1] 6
print(x %*=% 2)
#> [1] 12
print(x %/=% 5)
#> [1] 2.4
print(x %c=% 1:5)
#> [1] 2.4 1.0 2.0 3.0 4.0 5.0
print(`++`(x))
#> [1] 3.4 2.0 3.0 4.0 5.0 6.0
print(`--`(x))
#> [1] 2.4 1.0 2.0 3.0 4.0 5.0
```
