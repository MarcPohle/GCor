#' @title Tcov
#'
#' @description computes the threshold covariance of two vectors x and y at thresholds a and b
#'
#'
#' @param x a numeric vector
#' @param y a numeric vector of the same length as x
#' @param a threshold for x
#' @param b threshold for y
#'
#'
#' @return threshold covariance of x and y at a and b
#'
#'
#' @export


Tcov <- function(x,y,a,b){

  if (!(is.numeric(x) && is.numeric(y) && length(x) == length(y))){
    stop("`x` and `y` must be numeric vectors of the same length", call. = FALSE)
  }

  n <- length(x)

  # compute the empirical CDFs of x and y at a and b

  Fxa <- ecdf(x)(a)
  Fyb <- ecdf(y)(b)

  # compute the threshold errors

  error_x <- Fxa - (x <= a)
  error_y <- Fyb - (y <= b)


  # threshold covariance

  Cov <- mean(error_x*error_y)

}


