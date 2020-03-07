# #' g2plot legend
# #' 
# #' Configure options for the  legend.
# #' 
# #' @param g2plot Dygraph to configure legend options for.
# #' @param show When to display the legend. Specify "always" to always show the 
# #'   legend. Specify "onmouseover" to only display it when a user mouses over 
# #'   the chart. Specify "follow" to have the legend show as overlay to the chart
# #'   which follows the mouse. The default behavior is "auto", which results in
# #'   "always" when more than one series is plotted and "onmouseover" when only a
# #'   single series is plotted.
# #' @param width Width (in pixels) of the div which shows the legend.
# #' @param showZeroValues Show zero value labels in the legend.
# #' @param labelsDiv Show data labels in an external div, rather than on the 
# #'   graph. This value should be a div element id.
# #' @param labelsSeparateLines Put a <br/> between lines in the label string. 
# #'   Often used in conjunction with \code{labelsDiv}.
# #' @param hideOnMouseOut Whether to hide the legend when the mouse leaves the 
# #'   chart area. This option applies when \code{show} is set to "onmouseover". 
# #'   Note that this also affects the hiding of the \code{\link{dyHighlight}} on 
# #'   mouse out.
# #'   
# #' @return A dygraph with customized legend options
# #'  
# #' @examples
# #' library(g2plot)
# #' 
# #' dygraph(nhtemp, main = "New Haven Temperatures") %>% 
# #'   dySeries("V1", label = "Temperature (F)") %>%
# #'   dyLegend(show = "always", hideOnMouseOut = FALSE)   
# #'     
# #' @note See the 
# #'   \href{https://rstudio.github.io/dygraphs/gallery-plot-labels.html}{online
# #'   documentation} for additional details and examples.
# #'   
# #' @export
# g2Legend <- function(
#     g2plot
#     ,show = c("auto", "true", "false")
#     ,layout=c("vertical","horizontal")
#     ,offsetX=0
#     ,offsetY=0
#     ,itemGap
#     ,itemMarginBottom
#     ,itemWidth
#     ,marker=c('circle','square')
#     ) 
#     {
#   legend <- list()
#   legend$legend <- match.arg(show)
#   if (legend$legend == "never") {
#     legend$legend <- NULL
#     legend$showLabelsOnHighlight <- FALSE
#   }
#   legend$labelsDivWidth <- width
#   legend$labelsShowZeroValues <- showZeroValues
#   legend$labelsDiv <- labelsDiv
#   legend$labelsSeparateLines <- labelsSeparateLines
#   legend$hideOverlayOnMouseOut <- hideOnMouseOut
#   position:
# #   left-top,left-center,left-bottom,right-top,right-center,right-bottom,top-left,top-center,top-right,bottom-left,bottom-center,bottom-right。
# #   也可使用bottom,top,left,right设置位置，此时对应的值分别为bottom-center,top-center,left-bottom,right-bottom。
# #   默认为 bottom-center。
  

#   title: {
#   textAlign: 'center', # 文本对齐方向，可取值为： start middle end
#   fill: '#404040', # 文本的颜色
#   fontSize: '12', # 文本大小
#   fontWeight: 'bold', # 文本粗细
#   rotate: 30, # 文本旋转角度，以角度为单位，仅当 autoRotate 为 false 时生效
#   textBaseline: 'top' # 文本基准线，可取 top middle bottom，默认为middle
# }

#   # merge legend
#   g2plot$x$attrs <- mergeLists(dygraph$x$attrs, legend)
  
#   # return modified g2plot
#   g2plot
# }