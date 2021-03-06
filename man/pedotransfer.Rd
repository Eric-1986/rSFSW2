% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Pedotransfer_Functions.R
\name{pedotransfer}
\alias{pedotransfer}
\alias{pdf_to_vwc}
\alias{pdf_to_swp}
\alias{SWPtoVWC}
\alias{VWCtoSWP}
\title{Pedotransfer functions to convert between soil moisture (volumetric water content, VWC)
 and soil water potential (SWP)}
\usage{
pdf_to_vwc(swp, sand, clay, thetas, psis, b, MPa_toBar = -10,
  bar_conversion = 1024)

pdf_to_swp(vwc, sand, clay, thetas, psis, b, bar_toMPa = -0.1,
  bar_conversion = 1024)

SWPtoVWC(swp, sand, clay)

VWCtoSWP(vwc, sand, clay)
}
\arguments{
\item{swp}{A numeric value, vector, or 2-dimensional object (matrix or data.frame).
The soil water potential (of the soil matrix) in units of MPa, i.e.,
the soil without the volume of rock and gravel.}

\item{sand}{A numeric value or vector. Sand content of the soil layer(s) (fraction 0-1).}

\item{clay}{A numeric value or vector. Clay content of the soil layer(s) (fraction 0-1).}

\item{vwc}{A numeric value, vector, or 2-dimensional object (matrix or data.frame).
The matric soil moisture, i.e., reduced by the volume of rock and gravel.}
}
\value{
Volumetric water content in units of m^3 (of water) / m^3 (of soil) [0, 1].
 There are six use cases:\enumerate{
   \item 1) \itemize{
               \item Input: SWP [single value]; sand and clay [single values]
               \item Output: VWC [single value]}
   \item 2) \itemize{
               \item Input: SWP [single value]; sand and clay [vectors of length d]
               \item Output: VWC [vector of length d]}
   \item 3) \itemize{
               \item Input: SWP [vector of length l]; sand and clay in fraction [single values]
               \item Output: VWC [vector of length l]}
   \item 4) \itemize{
               \item Input: SWP [vector of length l]; sand and clay [vectors of length d]
               \item Output: VWC [l x d matrix] where SWP is repeated for each column}
   \item 5) \itemize{
               \item Input: SWP [l x d matrix]; sand and clay [single values]
               \item Output: VWC [l x d matrix]}
   \item 6) \itemize{
               \item Input: SWP [l x d matrix]; sand and clay [vectors of length d]
               \item Output: VWC [l x d matrix], sand and clay vectors are repeated for each row}
 }

Soil water potential in units of MPa [-Inf, 0]. There are six use cases:
 \enumerate{
   \item 1) \itemize{
               \item Input: VWC [single value]; sand and clay [single values]
               \item Output: SWP [single value]}
   \item 2) \itemize{
               \item Input: VWC [single value]; sand and clay [vectors of length d]
               \item Output: SWP [vector of length d]}
   \item 3) \itemize{
               \item Input: VWC [vector of length l]; sand and clay in fraction [single values]
               \item Output: SWP [vector of length l]}
   \item 4) \itemize{
               \item Input: VWC [vector of length l]; sand and clay [vectors of length d]
               \item Output: SWP [l x d matrix] where VWC is repeated for each column}
   \item 5) \itemize{
               \item Input: VWC [l x d matrix]; sand and clay [single values]
               \item Output: SWP [l x d matrix]}
   \item 6) \itemize{
               \item Input: VWC [l x d matrix]; sand and clay [vectors of length d]
               \item Output: SWP [l x d matrix], sand and clay vectors are repeated for each row}
 }
}
\description{
Pedotransfer functions to convert between soil moisture (volumetric water content, VWC)
 and soil water potential (SWP)

Calculate volumetric water content from soil water potential and soil texture

Calculate soil water potential from volumetric water content and soil texture
}
\section{Note}{

 either swp or sand/clay needs be a single value


 either vwc or sand/clay needs be a single value
}

\references{
Cosby, B. J., G. M. Hornberger, R. B. Clapp, and T. R. Ginn. 1984. A statistical exploration of the relationships of soil moisture characteristics to the physical properties of soils. Water Resources Research 20:682-690.
}
