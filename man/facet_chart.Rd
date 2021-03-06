% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/facet_chart.R
\name{facet_chart}
\alias{facet_chart}
\title{Facet Chart}
\usage{
facet_chart(
  data,
  subradius = 0,
  file_name = "none",
  size = 1,
  font = "sans",
  rotate_radians = 0,
  rotate_degrees = 0,
  file_width = 10,
  file_height = 10,
  dpi = 500,
  color = "black",
  fade = 85,
  tick = 0,
  cor_labels = TRUE,
  dist_test_label = 2/3,
  rotate_test_label_radians = 0,
  rotate_test_label_degrees = 0,
  size_cor_labels = 1,
  size_test_label = 1,
  size_facet_labels = 1,
  width_axes = 1,
  width_circles = 1,
  width_tick = 1,
  size_tick_label = 1
)
}
\arguments{
\item{data}{SEM estimates in the appropriate format, given by the input
functions.}

\item{subradius}{integer; same unit as center distances; radius of the facet
circles; defaults to 0, in which case an appropriate value is estimated.}

\item{file_name}{character; name of the file to save. Supported formats are:
"pdf" (highest quality and smallest file size), "png", "jpeg"; defaults to "none".}

\item{size}{integer; changes the size of most chart objects simultaneously.}

\item{font}{character; text font, use extrafonts to access additional fonts;
defaults to "sans", which is "Helvetica".}

\item{rotate_radians}{integer; radian angle to rotate the chart
counter-clockwise by; use fractions of pi (e.g. pi/2 = 90 degrees).}

\item{rotate_degrees}{integer; angle in degrees to rotate the chart
counter-clockwise by.}

\item{file_width}{integer; file width in inches; defaults to 10.}

\item{file_height}{integer; file height in inches; defaults to 10.}

\item{dpi}{integer; resolution in dots per inch for "png" and "jpeg" files;
defaults to 500.}

\item{color}{accent color; defaults to "black".}

\item{fade}{integer; brightness of the gray tones between 0 = "black" and 100
= "white" in steps of 1; defaults to 85.}

\item{tick}{numeric; axis tick position; defaults to 0, in which case an
appropriate value is estimated.}

\item{cor_labels}{logical; if \code{TRUE}, shows latent correlations between
facets; defaults to \code{TRUE}.}

\item{dist_test_label}{integer; position of the test label relative to the
surrounding circle; defaults to 2/3, in which case the test label is
displayed 2/3 of the way from the center to the surrounding circle.}

\item{rotate_test_label_radians}{integer; radian angle to rotate the test
label counter-clockwise by; use fractions of pi (e.g. pi/2 = 90 degrees).}

\item{rotate_test_label_degrees}{integer; angle in degrees to rotate the
global label counter-clockwise by.}

\item{size_cor_labels}{integer; correlation font size relative to default.}

\item{size_test_label}{integer; test font size relative to default.}

\item{size_facet_labels}{integer; facet font size relative to default.}

\item{width_axes}{integer; radial axis width relative to default.}

\item{width_circles}{integer; facet circle outline width relative to default.}

\item{width_tick}{integer; axis tick line width relative to default.}

\item{size_tick_label}{integer; axis tick font size relative to default.}
}
\value{
Object of the class "ggplot".
}
\description{
Creates a facet chart, showing the facets of a test.
}
\details{
Pdf files will be vector based and can be scaled arbitrarily. For
  other formats use \code{file_width}, \code{file_height}, and \code{dpi} to
  avoid later rescaling and loss of quality.
}
\examples{
# as simple as that:
facet_chart(SMTQ)

}
\seealso{
\code{\link{item_chart}} \code{\link{nested_chart}}
}
