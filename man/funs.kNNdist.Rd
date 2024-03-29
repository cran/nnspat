% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NNCTFunctions.R
\name{funs.kNNdist}
\alias{funs.kNNdist}
\alias{kthNNdist}
\alias{kNNdist}
\title{Functions for the \eqn{k^{th}} and \code{k} NN distances}
\usage{
kthNNdist(x, k, is.ipd = TRUE, ...)

kNNdist(x, k, is.ipd = TRUE, ...)
}
\arguments{
\item{x}{The IPD matrix (if \code{is.ipd=TRUE}) or a data set of points in matrix or data frame form where points
correspond to the rows (if \code{is.ipd = FALSE}).}

\item{k}{Integer specifying the number of NNs (of subjects).}

\item{is.ipd}{A logical parameter (default=\code{TRUE}). If \code{TRUE}, \code{x} is taken as the inter-point distance
matrix, otherwise, \code{x} is taken as the data set with rows representing the data points.}

\item{\dots}{are for further arguments, such as \code{method} and \code{p}, 
passed to the \code{\link[stats]{dist}} function.}
}
\value{
\code{kthNNdist} returns an \eqn{n \times 2} matrix where \eqn{n} is data size (i.e., number of subjects) and
first column is the subject index and second column is the \eqn{k^{th}} NN distances.

\code{kNNdist} returns an \eqn{n \times (k+1)} matrix where \eqn{n} is data size (i.e., number of subjects) and
first column is the subject index and the remaining \code{k} columns contain the corresponding 
distances to \code{k} NN subjects.
}
\description{
Two functions: \code{kthNNdist} and \code{kNNdist}.

\code{kthNNdist} returns the distances between subjects and their \eqn{k^{th}} NNs. The output is an \eqn{n \times 2} matrix where 
\eqn{n} is the data size and first column is the subject index and second column contains the corresponding 
distances to \eqn{k^{th}} NN subjects. 

\code{kNNdist} returns the distances between subjects and their \code{k} NNs.
The output is an \eqn{n \times (k+1)} matrix where 
\eqn{n} is the data size and first column is the subject index and the remaining \code{k} columns contain the corresponding 
distances to \code{k} NN subjects.
}
\examples{
#Examples for kthNNdist
#3D data points, gives NAs when n<=k
n<-20  #or try sample(1:20,1)
Y<-matrix(runif(3*n),ncol=3)
ipd<-ipd.mat(Y)
kthNNdist(ipd,3)
kthNNdist(Y,3,is.ipd = FALSE)
kthNNdist(ipd,5)
kthNNdist(Y,5,is.ipd = FALSE)
kthNNdist(Y,3,is.ipd = FALSE,method="max")

#1D data points
X<-as.matrix(runif(5)) # need to be entered as a matrix with one column
#(i.e., a column vector), hence X<-runif(5) would not work
ipd<-ipd.mat(X)
kthNNdist(ipd,3)

#Examples for kNNdist
#3D data points, gives NAs if n<=k for n,n+1,...,kNNs
n<-20  #or try sample(1:20,1)
Y<-matrix(runif(3*n),ncol=3)
ipd<-ipd.mat(Y)
kNNdist(ipd,3)
kNNdist(ipd,5)
kNNdist(Y,5,is.ipd = FALSE)

kNNdist(Y,5,is.ipd = FALSE,method="max")

kNNdist(ipd,1)
kthNNdist(ipd,1)

#1D data points
X<-as.matrix(runif(5)) # need to be entered as a matrix with one column
#(i.e., a column vector), hence X<-runif(5) would not work
ipd<-ipd.mat(X)
kNNdist(ipd,3)

}
\seealso{
\code{\link{NNdist}} and \code{\link{NNdist2cl}}
}
\author{
Elvan Ceyhan
}
