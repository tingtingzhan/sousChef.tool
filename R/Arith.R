

#' @title \link[methods]{Arith} Methods of \linkS4class{tool}
#' 
#' @description
#' \link[methods]{Arith} methods involving the `S4` \linkS4class{tool} class.
#' 
#' @param e1,e2 see **Usage**
#' 
#' @name Arith_tool
#' @aliases *,tool,numeric-method
#' @export
setMethod(f = '*', signature = signature(e1 = 'tool', e2 = 'numeric'), definition = \(e1, e2) {
  if (length(e2) != 1L || anyNA(e2)) {
    stop('illegal `e2`')
  }
  e1 <- e1 |>
    prune.tool()
  e1@waterEvap <- e1@waterEvap * e2 # !length(e1@waterEvap) compatible!!
  return(e1)
})


#' @rdname Arith_tool
#' @aliases *,numeric,tool-method
#' @export
setMethod(f = '*', signature = signature(e1 = 'numeric', e2 = 'tool'), definition = \(e1, e2) {
  e2 * e1
})



#' @rdname Arith_tool
#' @aliases /,tool,numeric-method
#' @export
setMethod(f = '/', signature = signature(e1 = 'tool', e2 = 'numeric'), definition = \(e1, e2) e1 * (1/e2))


#' @rdname Arith_tool
#' @aliases +,numeric,tool-method
#' @export
setMethod(f = '+', signature = signature(e1 = 'numeric', e2 = 'tool'), definition = \(e1, e2) e1 + e2@gram)


#' @rdname Arith_tool
#' @aliases -,numeric,tool-method
#' @export
setMethod(f = '-', signature = signature(e1 = 'numeric', e2 = 'tool'), definition = \(e1, e2) e1 - e2@gram)


# unary operator
#' @rdname Arith_tool
#' @aliases -,tool,missing-method
#' @export
setMethod(f = '-', signature = signature(e1 = 'tool', e2 = 'missing'), definition = \(e1, e2) - e1@gram)

