#' g2plot main function
#'
#' <Add Description>
#'
#' @import htmlwidgets
#' 
#' @param data data you will be plot
#' 
#' @export
g2plot <- function(data, width = NULL, height = NULL, elementId = NULL, ...) {
  # create native g2plot attrs object
  attrs <- list()
  attrs$title <- title
  attrs$xlabel <- NULL
  attrs$ylabel <- NULL
  attrs$labels <- names(data)
  attrs$legend <- "auto"
  attrs$forceFit <- FALSE
  attrs$axes$x <- list()
  attrs$axes$y <- list()
  attrs$meta <- list()
  # create x (g2plot attrs + some side data)
  # create native g2plot geom object
  geoms <- list()
  x <- list()
  x$attrs <-  NULL
  x$geoms <- geoms
  x$scale <-  NULL
  x$group <-  NULL
  x$annotations <- list()
  x$shadings <- list()
  x$events <- list()
  x$format <-  NULL
  # Add format for further processing here
  attr(x, "data") <- data
  # add data (strip names first so we marshall as a 2d array)
  # names(data) <- NULL
  x$data <- data
  # create widget
  g2plot <- htmlwidgets::createWidget(
    name = 'g2plot'
    , x
    , width = width
    , height = height
    , htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE)
    , package = 'g2plot'
    , elementId = elementId
  )
  g2plot
}
#' Shiny bindings for g2plot
#'
#' Output and render functions for using g2plot within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a g2plot
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name g2plot-shiny
#'
#' @export
g2plotOutput <- function(outputId, width = '100%', height = '400px') {
  htmlwidgets::shinyWidgetOutput(outputId, 'g2plot', width, height, package = 'g2plot')
}

#' @rdname g2plot-shiny
#' @export
renderG2plot <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) }
  # force quoted
  htmlwidgets::shinyRenderWidget(expr, g2plotOutput, env, quoted = TRUE)
}