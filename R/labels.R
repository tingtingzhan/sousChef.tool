
#' @export
labels.tool <- \(object, ...) {
  
  z <- if (length(object@alias)) {
    sprintf(
      fmt = '\u2756 %s \u2756 %s \u2756',
      object@alias, object@name
    )
  } else {
    sprintf(
      fmt = '\u2756 %s \u2756',
      object@name
    )
  }
  z |>
    make_ansi_style('royalblue')()
  
}



