utils::globalVariables(c("bushfire", "year", ".data"))
#' Plot Fire Weather Index trends
#'
#' Creates a time series plot of yearly Fire Weather Index values for
#' southeastern Australia, based on the `bushfire` dataset.
#'
#' @param data A tibble like `bushfire` containing columns `year`, `fwi_mean`, and `fwi_max`.
#' @param metric Character string, either `"mean"` or `"max"`, selecting which FWI measure to plot.
#'
#' @return A ggplot object showing the trend over time.
#' @examples
#' plot_fwi_trend(bushfire, metric = "mean")
#' plot_fwi_trend(bushfire, metric = "max")
#' @export
plot_fwi_trend <- function(data = bushfire, metric = "mean") {
  stopifnot(metric %in% c("mean", "max"))
  yvar <- if (metric == "mean") "fwi_mean" else "fwi_max"

  ggplot2::ggplot(data, ggplot2::aes(x = year, y = .data[[yvar]])) +
    ggplot2::geom_line(color = "firebrick") +
    ggplot2::geom_point() +
    ggplot2::geom_smooth(method = "lm", se = FALSE, linetype = "dashed", color = "grey40") +
    ggplot2::labs(
      title = paste("Fire Weather Index (", metric, ")", sep = ""),
      x = "Year", y = "FWI"
    ) +
    ggplot2::theme_minimal()
}
