# R package GCor

## Overview

This package accompanies the paper [_Generalised Covariances and Correlations_](https://arxiv.org/abs/2307.03594) by Tobias Fissler and Marc-Oliver Pohle.

The package provides functions to compute mean, quantile and threshold correlations. Further, it allows to create plots of quantile function and CDF correlation.

The main functions are:

* `mean_cor`: computes mean correlation 
* `Qcor`: computes quantile correlation
* `Tcor`: computes threshold correlation
* `QFcor_plot`: plots quantile function correlation
* `CDFcor_plot`: plots CDF correlation

## Installation

To install the package from GitHub and load it, run the following `R` code:

```
install.packages("devtools")
library(devtools)
install_github("MarcPohle/GCor")
library(GCor)

```

## Example
