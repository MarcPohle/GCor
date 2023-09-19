#' @title CDFcor_plot
#'
#' @description plots the CDF correlation of two vectors x and y on an equal-spaced grid
#'
#'
#' @param x a numeric vector
#' @param y a numeric vector of the same length as x
#' @param grid regulates the grid size (which is grid^2) of the equal-spaced grid
#' @param xlim limits for the x-axis, defaults to (min(x),max(x))
#' @param ylim limits for the y-axis, defaults to (min(y),max(y))
#'
#' @return plot of the CDF correlation of x and y
#'
#'
#' @export
#' @import latex2exp

CDFcor_plot <- function(x,y,grid,xlim,ylim){

  if (!(is.numeric(x) && is.numeric(y) && length(x) == length(y))){
    stop("`x` and `y` must be numeric vectors of the same length", call. = FALSE)
  }

  CDFcor_xy <- function(a, b){
    Tcor(x=x,y=y,a=a, b=b)
  }

  plot_contour(f=CDFcor_xy,xlim=xlim,ylim=ylim,grid=grid,xlab=TeX(r'($a$)'),ylab=TeX(r'($b$)'),bins=40)

}
