#' @title contour_plot
#'
#' @description visualizes a two-dimensional function with a contour plot on an equal-spaced grid with a binned colour scheme
#'
#'
#' @param f a function in two variables, x and y
#' @param xlim limits for the x-axis, defaults to (min(x),max(x))
#' @param ylim limits for the y-axis, defaults to (min(y),max(y))
#' @param grid regulates the grid size (which is grid^2) of the equal-spaced grid
#' @param xlab: label for the x-axis
#' @param ylab: label for the y-axis
#' @param bins number of colour bins
#'
#' @return contour plot of f
#'
#' @importFrom ggplot2 ggplot


plot_contour <- function(f,xlim=c(min(x),max(x)),ylim=c(min(y),max(y)),grid,xlab,ylab,bins){
  x <- seq(xlim[1], xlim[2], length.out = grid)
  y <- seq(ylim[1], ylim[2], length.out = grid)
  data <- expand_grid(x = x, y = y)
  z <- rep(NA,grid^2)
  for (i in 1:grid){
    for (j in 1:grid){
      z [(i-1)*grid+j]<- f(x[i],y[j])
    }}
  data <- mutate(data, z)

  labels <- rep("",bins+1)

  addlabels <- seq(from=-1,to=1,length.out=11)

  addlabelsat <- seq(from=1, to=bins+1,length.out=11)

  labels[addlabelsat] <- addlabels

  g <- ggplot(data, aes(x = x, y = y,fill=z)) +
    geom_tile()+
    scale_fill_stepsn(n.breaks=bins,colors = hcl.colors(20, "Spectral"), limits = c(-1, 1),labels=labels)+
    guides(fill = guide_colourbar(title=NULL,ticks=FALSE,barheight=10))+
    xlab(xlab)+
    ylab(ylab)


  # "Green-Brown" or "Blue-Red 3" instead of "Spectral" are colorblind-safe, but for smaller ranges of values do not distinguish as well




  g

}
