% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/relabel.R
\name{relabel_raw}
\alias{relabel_raw}
\title{Relabel raw estimates}
\usage{
relabel_raw(data, before, after)
}
\arguments{
\item{data}{IPV raw estimates (as provided by \code{ipv_est} as
\code{est_raw})}

\item{before}{character; a vector of names to replace}

\item{after}{character; a vector of replacement names}
}
\value{
the same data with renamed values / variables
}
\description{
Relabel tests, facets, or items in IPV raw estimates
}
