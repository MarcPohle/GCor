#' @title FH_bound_threshold
#'
#' @description computes the Fréchet-Hoeffding upper/lower bound of x and y at thresholds a and b
#'
#'
#' @param x a numeric vector
#' @param y a numeric vector of the same length as x
#' @param a threshold for x
#' @param b threshold for y
#' @param upper if TRUE (default) the upper bound is computed, if FALSE the lower bound
#'
#' @return Fréchet-Hoeffding upper/lower bound of x and y at a and b
#'
#'
#' @export


FH_bound_threshold <- function(x,y,a,b,upper=TRUE){

  if (!(is.numeric(x) && is.numeric(y) && length(x) == length(y))){
    stop("`x` and `y` must be numeric vectors of the same length", call. = FALSE)
  }

  # value of CDF at threshold

  alphastar <- mean(x <= a)
  betastar <- mean(y <= b)

  # calculate the bounds




  if(upper==TRUE){min(c(alphastar,betastar)) - alphastar*betastar}
  else{max(c(alphastar+betastar-1,0)) - alphastar*betastar}


}

