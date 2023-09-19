#' @title mean_cor
#'
#' @description computes the mean correlation of two vectors x and y
#'
#'
#' @param x a numeric vector
#' @param y a numeric vector of the same length as x
#'
#' @return mean correlation of x and y
#'
#'
#' @export


mean_cor <- function(x,y){

  if (!(is.numeric(x) && is.numeric(y) && length(x) == length(y))){
    stop("`x` and `y` must be numeric vectors of the same length", call. = FALSE)
  }

  Cov <- cov(x,y, method="pearson")
  Cov_co <- cov(sort(x),sort(y), method="pearson")
  Cov_counter <- cov(sort(x),sort(y, decreasing = T), method="pearson")
  if(Cov>0){Cor <- Cov/abs(Cov_co)}
  else{Cor <- Cov/abs(Cov_counter)}

  Cor

}
