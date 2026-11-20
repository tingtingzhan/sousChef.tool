
# \CRANpkg{generics} is by Hadley (and Posit)

#' @exportS3Method generics::prune
prune.tool <- \(tree, ...) {
  x <- tree; rm(tree)
  tool(
    name = x@name, name2 = x@name2, 
    alias = x@alias,
    gram = x@gram,
    # other slots: all suppressed
    waterEvap = x@waterEvap
  )
}