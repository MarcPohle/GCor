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

This is a simple example, where we compute some generalised correlations from a 
bivariate normal sample.

```

# use the MASS-package to simulate a bivariate normal sample

install.packages("MASS") 
library("MASS")

n <- 1000 # sample size
mu <- c(0,0) # mean
Sigma <- matrix(data=c(1,0.5,0.5,1),nrow=2) # variance matrix
data <- mvrnorm(n = n, mu=mu, Sigma=Sigma)
x <- data[,1]
y <- data[,2]


# calculate mean correlation and for comparison Pearson correlation
# (the two are equal [in population] for a joint normal distribution)

mean_cor(x,y)
cor(x,y)


# calculate threshold correlation at thresholds 0 and 1

Tcor(x,y,a=0,b=1)


# calculate quantile correlation at the the medians, i.e. median correlation

Qcor(x,y,alpha=0.5,beta=0.5)


# take a look at the scatter plot

scatter_plot(x,y,xlab="x",ylab="y")


# plot CDF correlation

CDFcor_plot(x,y,grid=100,xlim=c(-1.5,1.5),ylim=c(-1.5,1.5))


# plot quantile function correlation

QFcor_plot(x,y,grid=100,xlim=c(0.1,0.9),ylim=c(0.1,0.9))

```

