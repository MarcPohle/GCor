#' @title Qcov
#'
#' @description computes the quantile covariance of two vectors x and y at quantile levels alpha and beta
#'
#'
#' @param x a numeric vector
#' @param y a numeric vector of the same length as x
#' @param alpha quantile level for x
#' @param beta quantile level for y
#'
#'
#' @return quantile covariance of x and y at alpha and beta



Qcov <- function(x,y,alpha,beta){

  if (!(is.numeric(x) && is.numeric(y) && length(x) == length(y))){
    stop("`x` and `y` must be numeric vectors of the same length", call. = FALSE)
  }

  n <- length(x)

  # estimate the unconditional quantiles

  qx <- quantile(x,probs=alpha,type=1)
  qy <- quantile(y,probs=beta, type=1)

  # quantile level at corresponding jump of the CDF

  alphastar <- mean(x <= qx)
  betastar <- mean(y <= qy)

  # compute the quantile errors

  error_x <- alphastar - (x <= qx)
  error_y <- betastar - (y <= qy)


  # quantile covariance

  Cov <- mean(error_x*error_y)

}


