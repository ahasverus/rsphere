
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rsphere

<!-- badges: start -->

[![R build
status](https://github.com/ahasverus/rsphere/workflows/R-CMD-check/badge.svg)](https://github.com/ahasverus/rsphere/actions)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of rsphere is to plot a 2D shaded sphere with a two-colours
gradient.

## Installation

You can install the development version from
[GitHub](https://github.com/ahasverus/rsphere) with:

``` r
# install.packages("remotes")
remotes::install_github("ahasverus/rsphere")
```

## Usage

``` r
plot(x = 0, y = 0, asp = 1, xlim = c(-1, 1), ylim = c(-1, 1), axes = FALSE, ann = FALSE)
rsphere::add_sphere()
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

``` r
plot(x = 0, y = 0, asp = 1, xlim = c(-1, 1), ylim = c(-1, 1), axes = FALSE, ann = FALSE)
rsphere::add_sphere(x1 = 0.5, y1 = -0.5, col = c("black", "red"))
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />
