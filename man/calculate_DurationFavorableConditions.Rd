% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GISSM.R
\name{calculate_DurationFavorableConditions}
\alias{calculate_DurationFavorableConditions}
\title{Function to calculate for each day of the year, duration in days of upcoming favorable conditions accounting for consequences.unfavorable = 0 (if conditions become unfavorable, then restart the count), =1 (resume)}
\usage{
calculate_DurationFavorableConditions(RYyear, consequences.unfavorable,
  Germination_DuringFavorableConditions, RYyear_ForEachUsedDay)
}
\description{
Function to calculate for each day of the year, duration in days of upcoming favorable conditions accounting for consequences.unfavorable = 0 (if conditions become unfavorable, then restart the count), =1 (resume)
}
