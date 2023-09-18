#' @title scatter_plot
#'
#' @description draws a scatter plot (or a bubble plot) of x and y
#'
#'
#' @param x a numeric vector
#' @param y a numeric vector of the same length as x
#' @param bubbleplot if TRUE uses a bubbleplot, which is useful to avoid overplotting for discrete variables, if FALSE (the default) draws a usual scatter plot
#' @param xlab: label for the x-axis
#' @param ylab: label for the y-axis
#' @param xlim: limits for the x-axis, defaults to (min(x),max(x))
#' @param ylim: limits for the y-axis, defaults to (min(y),max(y))
#'
#' @return scatter plot of x and y
#'
#' @importFrom tidyverse ggplot


scatter_plot <- function(x,y,bubbleplot=FALSE,xlab,ylab,xlim=c(min(x),max(x)),ylim=c(min(y),max(y))){

  if (!(is.numeric(x) && is.numeric(y) && length(x) == length(y))){
    stop("`x` and `y` must be numeric vectors of the same length", call. = FALSE)
  }

  data <- data.frame(x,y)

    if(bubbleplot==FALSE){
      g <- ggplot(data, aes(x,y))+
        geom_point()+
        xlab(xlab)+
        ylab(ylab)+
        xlim(xlim)+
        ylim(ylim)
    }

    else{ g <- ggplot(data, aes(x,y))+
      geom_count()+
      xlab(xlab)+
      ylab(ylab)+
      xlim(xlim)+
      ylim(ylim)
    }

  g
}

