% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NNCTFunctions.R
\name{funs.pijPij}
\alias{funs.pijPij}
\alias{p11}
\alias{P11}
\alias{p12}
\alias{P12}
\alias{p111}
\alias{P111}
\alias{p1111}
\alias{P1111}
\alias{p112}
\alias{P112}
\alias{p122}
\alias{p123}
\alias{P123}
\alias{p1234}
\alias{P1234}
\alias{p1223}
\alias{p1123}
\alias{P1123}
\alias{p1122}
\alias{P1122}
\alias{p1112}
\alias{P1112}
\title{The functions for probability of selecting a number of points 
from respective classes}
\usage{
p11(k, n)

P11(nvec)

p12(k, l, n)

P12(nvec)

p111(k, n)

P111(nvec)

p1111(k, n)

P1111(nvec)

p112(k, l, n)

P112(nvec)

p122(k, l, n)

p123(k, l, m, n)

P123(nvec)

p1234(k, l, m, p, n)

P1234(nvec)

p1223(k, l, m, n)

p1123(k, l, m, n)

P1123(nvec)

p1122(k, l, n)

P1122(nvec)

p1112(k, l, n)

P1112(nvec)
}
\arguments{
\item{k, l, m, p}{Positive integers, usually representing the class sizes, 
used in \code{pij} type functions only.
Number of these arguments required depends on the number of 
distinct indices of \eqn{p}, e.g. \eqn{p_{ij}} requires
\code{k,l,n} and \eqn{p_{iijk}} requires \code{k,l,m,n} as input.}

\item{n}{A positive integer representing the size of the data set 
(i.e., number of observations in the data
set).}

\item{nvec}{A \code{vector} of positive integers representing 
the sizes of classes in the data set, used in 
\code{Pij} type functions only.}
}
\value{
Probability values for the selected points being 
from the indicated classes.
}
\description{
The ancillary probability functions used in computation of
the variance-covariance matrices
of various NN spatial tests such as NNCT tests and 
tests based on other contingency tables.
These functions can be classified as \code{pij} 
and \code{Pij} type functions. 
The \code{pij} functions are for individual 
probabilities and the corresponding \code{Pij} functions are 
the summed \code{pij} values.
For example \eqn{p_{iijk}}
is the probability of any 4 points with 2 from class \eqn{i}, 
and others are from classes \eqn{j} and \eqn{k}. 
These probabilities are for data from RL or CSR.
}
\seealso{
\code{\link{pk}}
}
