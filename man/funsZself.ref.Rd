% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NNCTFunctions.R
\name{funsZself.ref}
\alias{funsZself.ref}
\alias{Zself.ref.ct}
\alias{Zself.ref}
\title{Self-Reflexivity Test with Normal Approximation}
\usage{
Zself.ref.ct(
  rfct,
  nvec,
  alternative = c("two.sided", "less", "greater"),
  conf.level = 0.95
)

Zself.ref(
  dat,
  lab,
  alternative = c("two.sided", "less", "greater"),
  conf.level = 0.95,
  ...
)
}
\arguments{
\item{rfct}{An RCT, used in \code{Zself.ref.ct} only}

\item{nvec}{The \code{vector} of class sizes, used in \code{Zself.ref.ct} only}

\item{alternative}{Type of the alternative hypothesis in the test, one of \code{"two.sided"}, \code{"less"} or \code{"greater"}.}

\item{conf.level}{Level of the upper and lower confidence limits, default is \code{0.95}, 
for the difference of the off-diagonal entries, \eqn{N_{12}-N_{21}}}

\item{dat}{The data set in one or higher dimensions, each row corresponds to a data point,
used in \code{Zself.ref} only}

\item{lab}{The \code{vector} of class labels (numerical or categorical), used in \code{Zself.ref} only}

\item{\dots}{are for further arguments, such as \code{method} and \code{p}, passed to the \code{\link[stats]{dist}} function, used in \code{Zself.ref} only}
}
\value{
A \code{list} with the elements
\item{statistic}{The \eqn{Z} test statistic for self reflexivity corresponding to entry \eqn{(1,1)} in the RCT}
\item{p.value}{The \eqn{p}-value for the hypothesis test for the corresponding alternative}
\item{conf.int}{Confidence interval for the self reflexivity value (i.e., diagonal entry \eqn{(1,1)} value)
in the RCT at the given confidence level \code{conf.level} and depends on the type of \code{alternative}.} 
\item{estimate}{Estimate of the parameter, i.e., the observed diagonal entry \eqn{(1,1)} in the RCT, \code{rfct}.}
\item{null.value}{Hypothesized null value for the self reflexivity value (i.e., expected value of the 
diagonal entry \eqn{(1,1)} which is \eqn{E(N_{11})=R P_{aa}}) in the RCT.}
\item{alternative}{Type of the alternative hypothesis in the test, one of \code{"two.sided"}, \code{"less"}, \code{"greater"}}
\item{method}{Description of the hypothesis test}
\item{ct.name}{Name of the contingency table, \code{rfct}, returned by \code{Zself.ref.ct} only}
\item{data.name}{Name of the data set, \code{dat}, returned by \code{Zself.ref} only}
}
\description{
Two functions: \code{Zself.ref.ct} and \code{Zself.ref}.

Both functions are objects of class \code{"htest"} but with different arguments (see the parameter list below).
Each one performs hypothesis tests of self reflexivity in the NN structure using the
number of self-reflexive NN pairs (i.e., the first diagonal entry, \eqn{(1,1)}) in the RCT for \eqn{k \ge 2} classes.
That is, each test performs a test of self reflexivity corresponding to entry \eqn{(1,1)} in the RCT)
which is appropriate (i.e., have the appropriate asymptotic sampling distribution) for completely mapped data.
(See \insertCite{ceyhan:NNreflexivity2017;textual}{nnspat} for more detail).

The self reflexivity test is based on the normal approximation of the diagonal entry \eqn{(1,1)}
in the RCT and are due to \insertCite{ceyhan:NNreflexivity2017;textual}{nnspat}.

Each function yields the test statistic, \eqn{p}-value for the
corresponding alternative, the confidence interval, sample estimate (i.e., observed value) and null (i.e., expected) value for the
self reflexivity value (i.e., diagonal entry \eqn{(1,1)} value, respectively) in the RCT, 
and method and name of the data set used.

The null hypothesis is that \eqn{E(N_{11})=R P_{aa}} in the RCT, where \eqn{R} is the number of reflexive
NNs and \eqn{P_{aa}} is the probability of any two points selected are being from the same class.

The \code{Zself.ref} functions (i.e., \code{Zself.ref.ct} and \code{Zself.ref}) are different from the \code{Znnref}
functions (i.e., \code{\link{Znnref.ct}} and \code{\link{Znnref}}) and from \code{Znnself} functions (i.e., \code{\link{Znnself.ct}} and \code{\link{Znnself}}), and also
from \code{Znnself.sum} functions (i.e., \code{Znnself.sum.ct} and \code{Znnself.sum}).
\code{Zself.ref} functions are for testing the self reflexivity for the entire data set
using entry \eqn{(1,1)} in RCT while \code{Znnself} functions are testing the self reflexivity at a class-specific level
(i.e., for each class) using the first column in the SCCT, \code{Znnref} functions are for testing the self
reflexivity and mixed non-reflexivity using the diagonal entries in the RCT, and
\code{Znnself.sum} functions are testing the cumulative species correspondence using the sum of the self column (i.e.,
the first column) in the SCCT.
}
\examples{
n<-20  #or try sample(1:20,1)
Y<-matrix(runif(3*n),ncol=3)
cls<-sample(1:2,n,replace = TRUE)  #or try cls<-rep(1:2,c(10,10))
ipd<-ipd.mat(Y)

nvec<-as.numeric(table(cls))
rfct<-rct(ipd,cls)

Zself.ref(Y,cls)
Zself.ref(Y,cls,method="max")

Zself.ref.ct(rfct,nvec)
Zself.ref.ct(rfct,nvec,alt="g")

#############
n<-40
Y<-matrix(runif(3*n),ncol=3)
cls<-sample(1:4,n,replace = TRUE)  #or try cls<-rep(1:2,c(10,10))
ipd<-ipd.mat(Y)

nvec<-as.numeric(table(cls))
rfct<-rct(ipd,cls)

Zself.ref(Y,cls,alt="g")

Zself.ref.ct(rfct,nvec)
Zself.ref.ct(rfct,nvec,alt="l")

}
\references{
\insertAllCited{}
}
\seealso{
\code{\link{Znnref.ct}}, \code{\link{Znnref}}, \code{\link{Zmixed.nonref.ct}} and
\code{\link{Zmixed.nonref}}
}
\author{
Elvan Ceyhan
}
