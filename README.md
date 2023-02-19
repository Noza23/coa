
<!-- README.md is generated from README.Rmd. Please edit that file -->

# coa

coa introduces compound assignment operators

<!-- badges: start -->

[![R-CMD-check](https://github.com/Noza23/coa/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Noza23/coa/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Codecov test
coverage](https://codecov.io/gh/Noza23/coa/branch/main/graph/badge.svg)](https://app.codecov.io/gh/Noza23/coa?branch=main)
<!-- badges: end -->

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
