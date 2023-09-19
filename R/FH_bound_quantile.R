#' @title FH_bound_quantile
#'
#' @description computes the Fréchet-Hoeffding upper/lower bound of x and y at quantile levels alpha and beta
#'
#'
#' @param x a numeric vector
#' @param y a numeric vector of the same length as x
#' @param alpha quantile level for x
#' @param beta quantile level for y
#' @param upper if TRUE (default) the upper bound is computed, if FALSE the lower bound
#'
#' @return Fréchet-Hoeffding upper/lower bound of x and y at alpha and beta
#'
#'
#' @export

FH_bound_quantile <- function(x,y,alpha,beta,upper=TRUE){

  if (!(is.numeric(x) && is.numeric(y) && length(x) == length(y))){
    stop("`x` and `y` must be numeric vectors of the same length", call. = FALSE)
  }

  # estimate the unconditional quantiles

  qx <- quantile(x,probs=alpha,type=1)
  qy <- quantile(y,probs=beta, type=1)

  # quantile level at corresponding jump of the CDF

  alphastar <- mean(x <= qx)
  betastar <- mean(y <= qy)

  # calculate the bounds




  if(upper==TRUE){min(c(alphastar,betastar)) - alphastar*betastar}
  else{max(c(alphastar+betastar-1,0)) - alphastar*betastar}


}


