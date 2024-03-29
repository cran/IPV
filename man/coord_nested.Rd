% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nested_chart.R
\name{coord_nested}
\alias{coord_nested}
\title{Coord Nested}
\usage{
coord_nested(
  data,
  cd_method = "aggregate",
  test_order = NULL,
  facet_order = NULL,
  subradius = 0,
  tick = 0,
  rotate_tick_label = 0,
  rotate_radians = 0,
  rotate_degrees = 0,
  subrotate_radians = 0,
  subrotate_degrees = 0,
  dist_construct_label = 10,
  rotate_construct_label_radians = 0,
  rotate_construct_label_degrees = 0,
  dist_test_labels = 2/3,
  rotate_test_labels_radians = 0,
  rotate_test_labels_degrees = 0,
  prepare_item_charts = FALSE,
  correlations = TRUE,
  cor_spacing = 0,
  relative_scaling = 0,
  xarrows = TRUE
)
}
\arguments{
\item{data}{Object of class IPV as created by the function 'ipv_est'}

\item{cd_method}{character; method to summarize center distances, either
"mean" or "aggregate", see details; defaults to "aggregate".}

\item{test_order}{character; vector of test names in desired order
(counter-clockwise); defaults to NULL, in which case the order is based on
the correlation matrix columns in 'data'.}

\item{facet_order}{character; vector of all facet names of all tests in
desired order (counter-clockwise); defaults to NULL, in which case the order
is based on the correlation matrix columns in 'data'.}

\item{subradius}{integer; same unit as center distances; radius of the facet
circles; defaults to 0, in which case an appropriate value is estimated.}

\item{tick}{numeric; axis tick position; defaults to 0, in which case an
appropriate value is estimated.}

\item{rotate_tick_label}{numeric; number of positions to move the tick label
(counter-clockwise); defaults to 0.}

\item{rotate_radians}{integer; radian angle to rotate the chart
counter-clockwise by; use fractions of pi (e.g. pi/2 = 90 degrees).}

\item{rotate_degrees}{integer; angle in degrees to rotate the chart
counter-clockwise by.}

\item{subrotate_radians}{integer; radian angle or vector of radian angles to
rotate the nested facet charts counter-clockwise by; use fractions of pi
(e.g. pi/2 = 90 degrees).}

\item{subrotate_degrees}{integer; angle in degrees or vector of angles in
degrees to rotate the nested facet charts counter-clockwise by.}

\item{dist_construct_label}{integer; position of the construct label relative
to the surrounding circle; defaults to 10, in which case an appropriate
value is estimated; a value of .5 would position the label halfway between
the center and the surrounding circle.}

\item{rotate_construct_label_radians}{integer; radian angle to rotate the
construct label counter-clockwise by; use fractions of pi (e.g. pi/2 = 90
degrees).}

\item{rotate_construct_label_degrees}{integer; angle in degrees to rotate the
construct label counter-clockwise by.}

\item{dist_test_labels}{integer; position of the test labels relative to the
surrounding circle; defaults to 2/3, in which case the test labels are
displayed 2/3 of the way from the centers to the surrounding circles.}

\item{rotate_test_labels_radians}{integer; radian angle or vector of radian
angles to rotate the test labels counter-clockwise by; use fractions of pi
(e.g. pi/2 = 90 degrees).}

\item{rotate_test_labels_degrees}{integer; angle or vector of angle in degrees
to rotate the test labels counter-clockwise by.}

\item{prepare_item_charts}{logical; if \code{TRUE}, generates the item chart
coordinates for all factors by calling \code{\link{coord_items}}.}

\item{correlations}{logical; if \code{TRUE}, generates the coordinates for the
latent correlations between tests. Sets up a ring to draw them in. If
\code{FALSE}, the ring and the correlations are omitted, simplifying the
chart significantly.}

\item{cor_spacing}{integer; if \code{correlations = TRUE}: width of the ring,
the latent correlations between tests are drawn in; defaults to 0, in which
case an appropriate value is estimated.}

\item{relative_scaling}{integer; relative size of the global chart scale
compared to the nested facet chart scales; defaults to 0, in which case an
appropriate value is estimated.}

\item{xarrows}{logical; should arrows between tests be displayed?; defaults to TRUE.}
}
\value{
List containing coordinates of chart objects.
}
\description{
Generates the coordinates for a nested chart and all other charts.
}
\details{
Use \code{\link{nested_chart}} to create nested charts.
}
\seealso{
\code{\link{plot_nested}} \code{\link{nested_chart}}
}
