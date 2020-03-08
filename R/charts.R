# the supported functions of g2plot 
#
#
#' @export point
#' @rdname point
point <- function(g2plot, position, color, size, shape, ...) {
  # line chart for g2plot
  geoms <- list(list())
  geoms[[1]]$type <- 'point'
  geoms[[1]]$position <- position
  geoms[[1]]$color <- color
  geoms[[1]]$size <- size
  if(missing(shape)) shape<-'circle'
  geoms[[1]]$shape <- shape
  if (length(names(g2plot$x$geoms)) == 0) {
    names(geoms) <- 'chart1'
    g2plot$x$geoms <- geoms
  }
  else {
    names(geoms) <- paste('chart', length(names(g2plot$x$geoms)) + 1, sep = '')
    g2plot$x$geoms <- mergeLists(g2plot$x$geoms, geoms)
  }
  # return modified g2plot
  g2plot
}

#' @export line
#' 
line <- function(g2plot, position, color, size, shape, ...) {
  # line chart for g2plot
  geoms <- list(list())
  geoms[[1]]$type <- 'line'
  geoms[[1]]$position <- position
  geoms[[1]]$color <- color
  geoms[[1]]$size <- size
  geoms[[1]]$shape <- shape
  if (length(names(g2plot$x$geoms)) == 0) {
    names(geoms) <- 'chart1'
    g2plot$x$geoms <- geoms
  }
  else {
    names(geoms) <- paste('chart', length(names(g2plot$x$geoms)) + 1, sep = '')
    g2plot$x$geoms <- mergeLists(g2plot$x$geoms, geoms)
  }
  # return modified g2plot
  g2plot
}


#' @export area
#'
area <- function( g2plot ,position,color,shape, ...) {
  geoms <- list(list())
  geoms[[1]]$type <- 'area'
  geoms[[1]]$position <- position
  geoms[[1]]$color <- color
  geoms[[1]]$shape <- shape
  if (length(names(g2plot$x$geoms)) == 0) {
    names(geoms) <- 'chart1'
    g2plot$x$geoms <- geoms
  }
  else {
    names(geoms) <- paste('chart', length(names(g2plot$x$geoms)) + 1, sep = '')
    g2plot$x$geoms <- mergeLists(g2plot$x$geoms, geoms)
  }
  # return modified g2plot
  g2plot
}

#' @export bubble
#' 
bubble <- function(chart, ...) {

}
#' @export column
#' 
column <- function(g2plot, position, color, shape=NULL, ...) {
  geoms <- list(list())
  geoms[[1]]$type <- 'interval'
  geoms[[1]]$position <- position
  geoms[[1]]$color <- color
  geoms[[1]]$shape <- shape
  if (length(names(g2plot$x$geoms)) == 0) {
    names(geoms) <- 'chart1'
    g2plot$x$geoms <- geoms
  }
  else {
    names(geoms) <- paste('chart', length(names(g2plot$x$geoms)) + 1, sep = '')
    g2plot$x$geoms <- mergeLists(g2plot$x$geoms, geoms)
  }
  # return modified g2plot
  g2plot
}

#' @export pie
#' 
pie <- function(chart, ...) {

}
#' @export radar
#' 
radar <- function(chart, ...) {

}
#' @export gauge
#' 
gauge <- function(chart, ...) {

}
#' @export funnel
#' 
funnel <- function(chart, ...) {

}




