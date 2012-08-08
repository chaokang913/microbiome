\name{calculate.hclust}
\alias{calculate.hclust}
\title{Description: Calculate hierarchical clustering for standard selections in profiling script}
\usage{
  calculate.hclust(dat, hclust.method = "ward",
    metric = "correlation")
}
\arguments{
  \item{dat}{data matrix for clustering in log10 domain}

  \item{hclust.method}{clustering method}

  \item{metric}{clustering metrics

  Returns:}
}
\value{
  hclust object for log10 and for absolute scale data
}
\description{
  Arguments:
}
\examples{
# TBA
}
\author{
  Contact: Leo Lahti \email{leo.lahti@iki.fi}
}
\references{
  See citation("microbiome")
}
\keyword{utilities}
