#' @title QFcor_plot
#'
#' @description plots the quantile function correlation of two vectors x and y on an equal-spaced grid
#'
#'
#' @param x a numeric vector
#' @param y a numeric vector of the same length as x
#' @param grid regulates the grid size (which is grid^2) of the equal-spaced grid
#' @param xlim limits for the x-axis, defaults to (min(x),max(x))
#' @param ylim limits for the y-axis, defaults to (min(y),max(y))
#'
#' @return plot of the quantile function correlation of x and y
#'
#' @importFrom ggplot2 ggplot
#' @importFrom latex2exp TeX


QFcor_plot <- function(x,y,grid,xlim,ylim){

  if (!(is.numeric(x) && is.numeric(y) && length(x) == length(y))){
    stop("`x` and `y` must be numeric vectors of the same length", call. = FALSE)
  }

  QFcor_xy <- function(alpha, beta){
    Qcor(x=x,y=y,alpha=alpha, beta=beta)
  }

  plot_contour(f=QFcor_xy,xlim=xlim,ylim=ylim,grid=grid,xlab=TeX(r'($\alpha$)'),ylab=TeX(r'($\beta$)'),bins=40)

}
