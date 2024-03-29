% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NNCTFunctions.R
\name{asycovTkTl}
\alias{asycovTkTl}
\title{Asymptotic Covariance between \eqn{T_k} and \eqn{T_l} Values}
\usage{
asycovTkTl(dat, n1, k, l, nonzero.mat = TRUE, ...)
}
\arguments{
\item{dat}{The data set in one or higher dimensions, each row corresponds to a data point.}

\item{n1}{Number of cases}

\item{k, l}{Integers specifying the number of NNs (of subjects \eqn{i} and \eqn{m} in \eqn{a_{ij}(k) a_{mj}(l)}).}

\item{nonzero.mat}{A logical argument (default is \code{TRUE}) to determine whether the \eqn{A} matrix or the matrix of
nonzero locations of the \eqn{A} matrix will be used in the computation of \eqn{N_s} and \eqn{N_t}.
If \code{TRUE} the nonzero location matrix is used, otherwise the \eqn{A} matrix itself is used.}

\item{\dots}{are for further arguments, such as \code{method} and \code{p}, passed to the \code{\link[stats]{dist}} function.}
}
\value{
Returns the asymptotic covariance between \eqn{T_k} and \eqn{T_l} values.
}
\description{
This function computes the asymptotic covariance between \eqn{T_k} and \eqn{T_l} values
which is used in the computation of the asymptotic variance
of Cuzick and Edwards \eqn{T_{comb}} test, which is a linear combination of some \eqn{T_k} tests. 
The limit is as \eqn{n_1} goes to infinity.

The argument, \eqn{n_1}, is the number of cases (denoted as \code{n1} as an argument).
The number of cases are denoted as \eqn{n_1} and number of controls as \eqn{n_0} in this function
to match the case-control class labeling,
which is just the reverse of the labeling in \insertCite{cuzick:1990;textual}{nnspat}.

The logical argument \code{nonzero.mat} (default=\code{TRUE}) is for using the \eqn{A} matrix if \code{FALSE} or just the matrix of nonzero
locations in the \eqn{A} matrix (if \code{TRUE}) in the computations.
  
See page 80 of (\insertCite{cuzick:1990;textual}{nnspat}) for more details.
}
\examples{
n<-20  #or try sample(1:20,1)
Y<-matrix(runif(3*n),ncol=3)
cls<-sample(0:1,n,replace = TRUE)  #or try cls<-rep(0:1,c(10,10))
n1<-sum(cls==1)

k<-1 #try also 2,3 or sample(1:5,1)
l<-1 #try also 2,3 or sample(1:5,1)
c(k,l)

asycovTkTl(Y,n1,k,l)
asycovTkTl(Y,n1,k,l,nonzero.mat = FALSE)
asycovTkTl(Y,n1,k,l,method="max")

}
\references{
\insertAllCited{}
}
\seealso{
\code{\link{covTkTl}}, \code{\link{covTcomb}}, and \code{\link{Ntkl}}
}
\author{
Elvan Ceyhan
}
