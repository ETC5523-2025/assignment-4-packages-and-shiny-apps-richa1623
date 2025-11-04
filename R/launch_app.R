#' Launch the Shiny app
#'
#' This function launches the interactive Shiny application included with the package.
#' @export
launch_app <- function() {
  shiny::runApp(system.file("app", package = "bushfire"))
}
