#' Data Process
#'
#' Process  the  all data type  of R
#' @export
#' 
#' 
#' 
#' 
# split the data matrix for a scatterplot by series
data_scatter = function(x, y, series = NULL, type = 'scatter') {
  xy = unname(cbind(x, y))
  if (is.null(series)) return(list(list(type = type, data = xy)))
  xy = split(as.data.frame(xy), series)
  nms = names(xy)
  obj = list()
  for (i in seq_along(xy)) {
    obj[[i]] = list(name = nms[i], type = type, data = unname(as.matrix(xy[[i]])))
  }
  obj
}

data_bar = function(x, y, series = NULL, type = 'bar') {

  # plot the frequencies of x when y is not provided
  if (is.null(y)) {

    if (is.null(series)) {
      y = table(x)
      return(list(list(type = type, data = unname(c(y)))))
    }

    y = table(x, series)
    nms = colnames(y)
    obj = list()
    for (i in seq_len(ncol(y))) {
      obj[[i]] = list(name = nms[i], type = type, data = unname(y[, i]))
    }
    return(obj)

  }

  # when y is provided, use y as the height of bars
  if (is.null(series)) {
    return(list(list(type = type, data = y)))
  }

  xy = tapply(y, list(x, series), function(z) {
    if (length(z) == 1) return(z)
    stop('y must only have one value corresponding to each combination of x and series')
  })
  nms = colnames(xy)
  obj = list()
  for (i in seq_len(ncol(xy))) {
    obj[[i]] = list(name = nms[i], type = type, data = unname(xy[, i]))
  }
  obj

}

data_line = function(x, y, series = NULL) {
  if (is.null(x) && is.ts(y)) {
    x = as.numeric(time(y))
    y = as.numeric(y)
  }
  if (is.numeric(x)) {
    return(data_scatter(x, y, series, type = 'line'))
  }
  if (is.null(series)) {
    return(list(list(type = 'line', data = y)))
  }
  data_bar(x, y, series, type = 'line')
}
data_pie<-function()
{

}
data_doublePie<-function(){

}

dataTransform<-function(data){
    if(is.data.frame(data)){
    if( ncol(data) =0 ) print('There no data in dataframe')}
    else if(is.array(data)){print('array')}
    else if(is.atomic(data)){print('atomic')}
    else if(is.list(data)){print('list')}
    else if(is.vector(data)){print('c')}
    else if(is.matrix(data)){print('matrix')}
    else if(is.ts(data)){print('ts')}
    else if(is.tibble(data)){print('tibble')}
    else stop('data type is not supported')}

