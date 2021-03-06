% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Spatial_Functions.R
\name{align_with_target_res}
\alias{align_with_target_res}
\title{Calculate resolution of one coordinate system for points in their coordinate
 system transformed to a target coordinate system}
\usage{
align_with_target_res(res_from, crs_from, sp, crs_sp, crs_to)
}
\arguments{
\item{res_from}{A numeric vector of length two. The resolution in x and y direction in
the coordinate system \code{crs_from}.}

\item{crs_from}{A CRS object. The coordinate system of \code{res_from}.}

\item{sp}{A SpatialPoints object. Cell center graphics::points for which new
resolutions will be calculated.}

\item{crs_sp}{A CRS object. The coordinate system of \code{sp}.}

\item{crs_to}{A CRS object. The coordinate system in which the resulting resolution
will be calculated.}
}
\value{
A numeric vector of length two (if resolution is constant for each point) or a
 matrix with two columns for the x- and y-resolutions per row for each point.
}
\description{
Calculate resolution of one coordinate system for points in their coordinate
 system transformed to a target coordinate system
}
