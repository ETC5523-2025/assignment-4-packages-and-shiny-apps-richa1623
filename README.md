# bushfire

## Overview

The **bushfire** package provides yearly summaries of the Fire Weather Index (FWI) for southeastern Australia (1979–2020), reproducing the analysis of Oldenborgh et al. (2021, *NHESS*).\
It includes: - A cleaned dataset (`bushfire`) - Functions for analysis and visualization (e.g. `plot_fwi_trend()`) - An interactive Shiny app for exploring bushfire risk

This package was developed as part of Assignment 4 for ETC5521.

------------------------------------------------------------------------

## Installation

You can install the development version of **bushfire** from GitHub using:

``` r
# install.packages("remotes")
remotes::install_github("ETC5523-2025/assignment-4-packages-and-shiny-apps-richa1623")
```

## Usage

#### Load the package

``` r
{r}
library(bushfire)
```

#### Explore the dataset

``` r
{r}
head(bushfire)
```

#### Plot FWI trends

``` r
{r}
plot_fwi_trend(bushfire, metric = "mean")
```

#### Launch the Shiny app

``` r
{r}
launch_app() 
```

## Documentation

Full documentation, including vignettes and function references, is available on the pkgdown site: <https://github.com/ETC5523-2025/assignment-4-packages-and-shiny-apps-richa1623>

## License

This package is released under the MIT License. See LICENSE for details.

## Citation

If you use this package, please cite: Oldenborgh, G. J. van, et al. (2021). Attribution of the Australian bushfire risk to anthropogenic climate change. Natural Hazards and Earth System Sciences.
