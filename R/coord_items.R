#' Coord Items
#'
#' Generates the coordinates for an item chart.
#'
#' @param data SEM estimates in the appropriate format, given by the input
#'   functions.
#' @param facet_order character; vector of facet names in desired order
#'   (counter-clockwise); defaults to NULL, in which case the order is based on
#'   the correlation matrix columns in 'data'.
#' @param rotate_radians integer; radian angle to rotate the chart
#'   counter-clockwise by; use fractions of pi (e.g. pi/2 = 90 degrees).
#' @param rotate_degrees integer; angle in degrees to rotate the chart
#'   counter-clockwise by.
#' @param grid_limit integer; upper limit to which the grid lines should be
#'   drawn; defaults to 0, in which case an appropriate value is estimated.
#' @param dist_test_label integer; position of the test label relative to the
#'   surrounding circle; defaults to .5, in which case the test label is
#'   displayed halfway from the center to the surrounding circle.
#' @param rotate_test_label_radians integer; radian angle to rotate the test
#'   label counter-clockwise by; use fractions of pi (e.g. pi/2 = 90 degrees).
#' @param rotate_test_label_degrees integer; angle in degrees to rotate the test
#'   label counter-clockwise by.
#' @param width_items integer; item bar width relative to default.
#' @param length_items integer; item bar length relative to default.
#' @param length_ratio_items integer; relative item bar length; defaults to 1.5.
#' @param dodge integer; horizontal outward dodge of facet labels relative to
#'   default.
#'
#' @details Use \code{\link{item_chart}} to create item charts.
#'
#' @return List containing coordinates of chart objects.
#'
#' @seealso \code{\link{plot_items}} \code{\link{coord_nested}}
#'   \code{\link{item_chart}}
coord_items <- function (
  data,
  facet_order = NULL,
  rotate_radians = 0,
  rotate_degrees = 0,
  grid_limit = 0,
  dist_test_label = .5,
  rotate_test_label_radians = 0,
  rotate_test_label_degrees = 0,
  width_items = 1,
  length_items = 1,
  length_ratio_items = 1.5,
  dodge = 1) {


  # helper variables -----------------------------------------------------------

  cplx <- length(levels(data$cds$subfactor))
  rotate <- rotate_radians + rotate_degrees * pi / 180
  rotate_test_label <- rotate_test_label_radians +
    rotate_test_label_degrees * pi / 180
  maxcd <- max(data$cds$cd)
  if (grid_limit == 0) {
    grid_limit <- maxcd
  }
  axe_limit <- max(maxcd, grid_limit)
  if (is.null(facet_order)) {
    facet_order <- colnames(data$cors)
  }

  # chart objects --------------------------------------------------------------

  ## axes ---------------------------

  p_axes <- data.frame(phi = rep(NA, cplx),
                       rho = NA,
                       rholabel = NA)
  row.names(p_axes) <- facet_order
  p_axes$rho <- axe_limit * 1.2
  p_axes$phi <- c(2 * pi / cplx * c(1:cplx)) + rotate
  p_axes$phi[p_axes$phi > 2 * pi] <-
    p_axes$phi[p_axes$phi > 2 * pi] - 2 * pi
  p_axes$rholabel <- p_axes$rho * 1.1

  # reminder:
  # x = cos(phi) * rho
  # y = sin(phi) * rho
  c_axes <- p_axes
  # rounded values decrease display length in console
  c_axes[ ,1] <- round(cos(p_axes$phi) * p_axes$rho, digits = 7)
  c_axes[ ,2] <- round(sin(p_axes$phi) * p_axes$rho, digits = 7)
  c_axes[ ,3] <- round(cos(p_axes$phi) * p_axes$rholabel, digits = 7) +
    cos(p_axes$phi) * .1 * dodge * p_axes$rho
  c_axes[ ,4] <- round(sin(p_axes$phi) * p_axes$rholabel, digits = 7)
  names(c_axes) <- c("x", "y", "xlabel", "ylabel")


  ## items --------------------------

  # alternate length for distinguishability, visual size kept consistant across
  # different data, offset needed so that inner edges indicate center distances
  n <- length(data$cds$item)
  items <- data.frame(
    rho = rep(NA, n), phi = NA,
    x   = NA, y   = NA,
    x1  = NA, y1  = NA,
    x2  = NA, y2  = NA,
    length = NA)
  row.names(items) <- data$cds$item
  items$phi <- p_axes[as.character(data$cds$subfactor), "phi"]
  items$rho <- data$cds$cd + axe_limit * .00625 * width_items
  items <- items[order(items$phi, items$rho), ]
  items$x <- round(cos(items$phi) * items$rho, digits = 7)
  items$y <- round(sin(items$phi) * items$rho, digits = 7)

  # items are split by facets so each facet starts with a long item bar
  items$length <-  unlist(lapply(split(items, data$cds$subfactor),
                                 function (x) {
    x$length <- 1
    x$length[seq(from = 1, by = 2, to = length(x$length))] <- 2
  return(x$length)}))

  items$length[items$length == 1] <- 1.2 * length_items * axe_limit
  items$length[items$length == 2] <-
    1.2 * length_items * length_ratio_items * axe_limit * 1.0001
  # factor of 1.0001 separates the bars by length for further code

  items$x1 <- items$x - items$y / items$rho * .03 * items$length
  items$y1 <- items$y + items$x / items$rho * .03 * items$length
  items$x2 <- items$x + items$y / items$rho * .03 * items$length
  items$y2 <- items$y - items$x / items$rho * .03 * items$length


  ## grid ---------------------------

  # For the grid to scale dynamically with the data, magnitude and digits
  # are treated separately.
  # m = order of magnitude, d = digits, u = unit (10^?)
  m <- floor(log10(grid_limit))
  d <- grid_limit / 10 ^ m
  u <- 10 ^ (m - 1)

  # Three cases, to ensure a similar number of grid lines for all data
  if (floor(d) < 3) {
    grid <- data.frame(x = rep(0, floor(10 * d)),
                       y = 0,
                       r = NA,
                       alpha = .5)
    grid$r <- seq(from = u,
                  by = u,
                  to = floor(10 * d) * u)
    grid$alpha[seq(10, length(grid$alpha), 10)] <- 1
  }  else if (floor(d) < 5) {
    grid <- data.frame(x = rep(0, floor(5 * d)),
                       y = 0,
                       r = NA,
                       alpha = .5)
    grid$r <- seq(from = 2 * u,
                  by = 2 * u,
                  to = floor(5 * d) * 2 * u)
    grid$alpha[seq(5, length(grid$alpha), 5)] <- 1
  } else {
    grid <- data.frame(x = rep(0, floor(2 * d)),
                       y = 0,
                       r = NA,
                       alpha = .5)
    grid$r <- seq(from = 5 * u,
                  by = 5 * u,
                  to = floor(2 * d) * 5 * u)
    grid$alpha[seq(2, length(grid$alpha), 2)] <- 1
  }

  axis_tick <- data.frame(
    rho = grid[grid$alpha == 1, "r"] + u / 2,
    label = as.character(grid[grid$alpha == 1, "r"]),
    phi = NA,
    x = NA,
    y = NA)
  axis_tick$phi <- min(p_axes[p_axes$rho > 0, "phi"]) -
    pi / cplx

  axis_tick$x <- round(cos(axis_tick$phi) * axis_tick$rho, digits = 7)
  axis_tick$y <- round(sin(axis_tick$phi) * axis_tick$rho, digits = 7)


  ## test label ---------------------

  test_label <- data.frame(
    phi = mean(p_axes$phi[1] + pi / cplx) + rotate_test_label,
    rho = dist_test_label * axe_limit,
    label = data$cds$factor[1],
    x = NA, y = NA)
  test_label$x <- round(cos(test_label$phi) * test_label$rho, digits = 7)
  test_label$y <- round(sin(test_label$phi) * test_label$rho, digits = 7)


  # return ---------------------------------------------------------------------

  coord <- list(p_axes    = p_axes,
                c_axes    = c_axes,
                items     = items,
                grid      = grid,
                axis_tick = axis_tick,
                test_label     = test_label)

  return(coord)
}
