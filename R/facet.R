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
#' matrix matrix
#' @param by facet by fields at least one field,...
facet <- function(
    g2plot
, type = c('rect', 'list', 'circle', 'tree', 'mirror', 'matrix')
, by = NULL
, showTitle = c(TRUE, FALSE)
, ...) {
  facet <- list()
  #check type
  type <- match.arg(type)
  facet$type <- type
  showTitle <- match.arg(type)
  if (missing(showTitle)) showTitle = TRUE
  facet$showTitle <- showTitle
  #check fields 
  if (missing(by)) stop("You should specify at least one field")
  else if (length(by) > 2 && type == 'rect') stop("rect facet only aceept at most 2 fields")
  else if (type %in% c('list', 'circle', 'mirror', 'matrix') && length(by) != 1) stop("list/circle/mirror/matrix facet only aceept  1 fields")
  facet$fields <- by
  g2plot$x$facet <- mergeLists(g2plot$x$facet, facet)
  g2plot
}


