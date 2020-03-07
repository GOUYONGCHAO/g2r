# the supported functions of g2plot 
#
#
#' @export line
line <- function(gplot,position,color,size,shape,opacity,...) {
    # line chart for g2plot
    geom<-list(list())
    geom[[1]]$type<-'line'
    geom[[1]]$color<-color
    geom[[1]]$size<-size
    geom[[1]]$shape<-shape
    geom[[1]]$shape<-opacity
    if(length(names(gplot$geoms))==0){
        names(geoms)<-'chart1'
        gplot$geoms<-geoms
    }
    else {
        names(geoms)<-paste('chart',length(names(gplot$geoms)+1),sep='')
        gplot$geoms<-mergeLists(gplot$geoms,geoms)
    }
    # return modified g2plot
    gplot
 }

#' @export scatter
#' 
scatter <- function(chart, ...) {
}

#' @export area
#' 
area <- function(chart, ...) {

}
#' @export bubble
#' 
bubble <- function(chart, ...) {

}
#' @export column
#' 
column <- function(chart, ...) {

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




