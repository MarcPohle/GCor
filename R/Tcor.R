#' @title Tcor
#'
#' @description computes the threshold correlation of two vectors x and y at thresholds a and b
#'
#'
#' @param x a numeric vector
#' @param y a numeric vector of the same length as x
#' @param a threshold for x
#' @param b threshold for y
#'
#'
#' @return threshold correlation of x and y at a and b
#'
#'
#' @export


Tcor <- function(x,y,a,b){

  if (!(is.numeric(x) && is.numeric(y) && length(x) == length(y))){
    stop("`x` and `y` must be numeric vectors of the same length", call. = FALSE)
  }


  Cov <- Tcov(x,y,a,b)


  # correlation

  if(Cov>=0){
    Cor <- Cov/abs(FH_bound_threshold(x,y,a,b,upper=TRUE))}
  else{
    Cor <- Cov/abs(FH_bound_threshold(x,y,a,b,upper=FALSE))}

  Cor

}


