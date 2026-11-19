
#' @import methods
#' @import cli

# stopifnot(identical(' ', '\u0020'))

setOldClass(Classes = c('cli_ansi_string', 'ansi_string', 'character'))



#' @title Kitchen \linkS4class{tool}s
#' 
#' @description ..
#' 
#' @param treatment,program,waterEvap,operation,cooling,... see **Slots**
#' 
#' @slot name \link[cli]{ansi_string} or \link[base]{character} scalar, brand and name of kitchen tool
#' 
#' @slot alias \link[base]{character} scalar
#' 
#' @slot name2 any R object, currently supports \link[base]{character} or \linkS4class{tool}, brand and name of the auxiliary tool
#' 
#' @slot gram \link[base]{numeric} scalar, weight of the container, in grams
#' 
#' @slot capacity \link[base]{numeric} scalar, maximum capacity, in times of recipe
#' 
#' @slot treatment \link[base]{character} scalar, pre-treatment
#' 
#' @slot program \link[base]{character} scalar, program
#' 
#' @slot operation \link[base]{character} scalar or \link[base]{vector}, operation(s) on multiple days
#' 
#' @slot fahrenheit \link[base]{numeric} scalar 
#' 
#' @slot minute \link[base]{numeric} scalar
#' 
#' @slot cooling \link[base]{character} scalar or \link[base]{vector}, instructions of cooling down
#' 
#' @slot dont \link[base]{character} scalar or \link[base]{vector}
#' 
#' @slot waterEvap \link[base]{numeric} scalar, water evaporated in cooking (in grams) 
#' 
#' @export
setClass(Class = 'tool', slots = c(
  
  name = 'character',
  name2 = 'ANY',
  alias = 'character',
  
  gram = 'numeric',
  
  capacity = 'numeric',
  
  treatment = 'character',
  
  operation = 'character',
  program = 'character',
  fahrenheit = 'numeric',
  minute = 'numeric',
  waterEvap = 'numeric',
  
  cooling = 'character',
  
  dont = 'character'
  
))



# helper function
tool <- \(...) {
  
  x <- list(...) |>
    add_tool_url(name = 'kitchenaid', fmt = 'https://www.kitchenaid.com/p.%s.html', brand = 'Kitchen Aid') |>
    add_tool_url(name = 'instantpot', fmt = 'https://instantpot.com/products/%s', brand = 'Instant Pot') |>
    add_tool_url(name = 'nutribullet', fmt = 'https://www.nutribullet.com/shop/%s', brand = 'Nutribullet') |>
    add_tool_url(name = 'owala', fmt = 'https://owalalife.com/products/%s', brand = 'Owala') |>
    add_tool_url(name = 'sodastream', fmt = 'https://sodastream.com/products/%s', brand = 'SodaStream') |>
    add_tool_url(name = 'staub', fmt = 'https://www.zwilling.com/us/%s.html', brand = 'Staub') |>
    add_tool_url(name = 'stanley1913', fmt = 'https://www.stanley1913.com/products/%s', brand = 'Stanley')

  c(list(Class = 'tool'), x) |> 
    do.call(what = 'new', args = _)
  
}










