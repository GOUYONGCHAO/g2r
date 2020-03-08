#' facet main function
#'
#' facet for g2plot
#' 
#' 
#' @export facet
#' @param type rect	默认类型，指定 2 个维度作为行列，形成图表的矩阵。
#' list	指定一个维度，可以指定一行有几列，超出自动换行。
#' circle	指定一个维度，沿着圆分布。
#' tree	指定多个维度，每个维度作为树的一级，展开多层图表。
#' mirror	指定一个维度，形成镜像图表。
#' matrix
facet <- function(g2plot, type = c('rect', 'list', 'circle', 'tree', 'mirror', 'matrix'), by = NULL...) {
  type <- match.arg(type)
  g2plot$x$facet$type <- type
  g2plot
}


