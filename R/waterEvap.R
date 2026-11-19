

#' @exportS3Method sousChef.utils::waterEvap
waterEvap.tool <- \(x) {
  x@waterEvap |> sum()
}
