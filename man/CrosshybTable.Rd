% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/crosshyb.R
\name{CrosshybTable}
\alias{CrosshybTable}
\title{Cross-hybridization table between multimodal taxa as percentages of shared
probes. The number indicates how many percent of oligos for the row taxon
are also hybridizing the corresponding column taxon.}
\usage{
CrosshybTable(tax.level = "L1", chip = "HITChip", selected.taxa = NULL,
  phylogeny.info = NULL)
}
\arguments{
\item{tax.level}{Taxonomic level to investigate}

\item{chip}{Chip type (e.g. 'HITChip')}

\item{selected.taxa}{Restrict cross-hyb analysis to the selected groups.}

\item{phylogeny.info}{phylogeny.info}
}
\value{
A list containing cross-hybridization table
}
\description{
Cross-hybridization table between multimodal taxa as percentages of shared
probes. The number indicates how many percent of oligos for the row taxon
are also hybridizing the corresponding column taxon.
}
\examples{
ch <- CrosshybTable(tax.level = 'L1')
}
\author{
Contact: Leo Lahti \email{microbiome-admin@googlegroups.com}
}
\references{
See citation('microbiome')
}
\keyword{utilities}

