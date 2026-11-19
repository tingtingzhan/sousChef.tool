
#' @rdname tool-class
#' @param object see **Usage**
#' @importFrom consec cmod
#' @export
setMethod(f = show, signature = 'tool', definition = \(object) {
  
  x <- object; object <- NULL
  
  if (identical(x, new(Class = 'tool'))) return(invisible())
  
  x |>
    labels.tool() |>
    cat('\n')
  
  if (is.character(x@name2)) {
    x@name2 |>
      sprintf(fmt = '\u2756 %s \u2756') |> 
      make_ansi_style('royalblue')() |> 
      cat('\n')
  } else if (is(x@name2, 'tool')) {
    x@name2 |>
      labels.tool() |> 
      cat('\n')
  } else if (is.list(x@name2)) {
    x@name2 |>
      vapply(FUN = \(i) {
        if (!is(i, 'tool')) stop()
        i |>
          labels.tool()
      }, FUN.VALUE = '') |>
      cat(sep = '\n')
  }
  
  if (length(x@capacity)) {
    x@capacity |> 
      sprintf(fmt = '\u00d7%.1f recipes') |>
      bg_br_yellow() |>
      sprintf(fmt = ' \U1f9fa Max. Capacity: %s\n') |> 
      cat()
  }
  
  x@treatment |> 
    sprintf(fmt = ' \u21ac %s\n') |> 
    cat(sep = '')
  
  sprintf(
    fmt = ' \u2699\ufe0f %s %s\n',
    x@program,
    (names(x@program) %||% '') |> bg_br_yellow()
  ) |> 
    cat(sep = '')
  
  temperature <- sprintf(
    fmt = '\U1f321%.0f\u00b0F %.1f\u00b0C',
    x@fahrenheit,
    (x@fahrenheit - 32) * 5/9 # celsius
  ) |> 
    col_br_blue() |> style_bold()
  
  minute <- sprintf(
    fmt = '\u23f0%s %s', 
    x@minute |> 
      cmod(e2 = consec::minute, n = 3L) |>
      col_br_magenta() |> 
      style_bold(),
    (names(x@minute) %||% '') |> bg_br_yellow()
  ) |>
    trimws()
  
  if (length(minute) && length(temperature)) {
    sprintf(fmt = '   %s %s\n', temperature, minute) |> 
      cat(sep = '')
  } else if (length(minute)) {
    sprintf(fmt = '   %s\n', minute) |> 
      cat(sep = '')
  } else if (length(temperature)) {
    sprintf(fmt = '   %s\n', temperature) |> 
      cat(sep = '')
  } # else do nothing
  
  x@operation |>
    gsub(pattern = '\n', replacement = '') |>
    gsub(pattern = '^ *|(?<= ) | *$', replacement = '', perl = TRUE) |>
    sprintf(fmt = ' \U1f4a1 %s\n') |> 
    cat(sep = '')
  
  #cat('\n')
  
  x@cooling |> 
    sprintf(fmt = ' \U1f192 %s\n') |> 
    cat(sep = '')
  
  x@waterEvap |> 
    sprintf(fmt = ' \u2668 water evaporated: %.0f grams\n') |> 
    cat(sep = '')
  
  x@dont |>
    sprintf(fmt = ' \u274C %s\n') |> 
    cat(sep = '')
  
  cat('\n')
  
})

