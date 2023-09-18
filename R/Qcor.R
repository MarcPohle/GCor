#' @title Qcor
#'
#' @description computes the quantile correlation of two vectors x and y at quantile levels alpha and beta
#'
#'
#' @param x a numeric vector
#' @param y a numeric vector of the same length as x
#' @param alpha quantile level for x
#' @param beta quantile level for y
#'
#'
#' @return quantile correlation of x and y at alpha and beta



Qcor <- function(x,y,alpha,beta){

  if (!(is.numeric(x) && is.numeric(y) && length(x) == length(y))){
    stop("`x` and `y` must be numeric vectors of the same length", call. = FALSE)
  }


  Cov <- Qcov(x,y,alpha,beta)


  # correlation

  if(Cov>=0){
    Cor <- Cov/abs(FH_bound_quantile(x,y,alpha,beta,upper=TRUE))}
  else{
    Cor <- Cov/abs(FH_bound_quantile(x,y,alpha,beta,upper=FALSE))}

  Cor

}


