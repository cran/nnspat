% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NNCTFunctions.R
\name{funs.covNii}
\alias{funs.covNii}
\alias{covNii.ct}
\alias{covNii}
\title{Covariance Matrix of the Self Entries in a Species Correspondence Contingency Table (SCCT)}
\usage{
covNii.ct(ct, Vsq, Q, R)

covNii(dat, lab, ...)
}
\arguments{
\item{ct}{The NNCT or SCCT, used in \code{covNii.ct} only}

\item{Vsq}{The \code{vector} of variances of the diagonal entries \eqn{N_{ii}} in the NNCT or the self entries
(i.e., the first column) in the SCCT, used in \code{covNii.ct} only}

\item{Q}{The number of shared NNs, used in \code{covNii.ct} only}

\item{R}{The number of reflexive NNs (i.e., twice the number of reflexive NN pairs), used in \code{covNii.ct} only}

\item{dat}{The data set in one or higher dimensions, each row corresponds to a data point,
used in \code{covNii} only}

\item{lab}{The \code{vector} of class labels (numerical or categorical), used in \code{covNii} only}

\item{\dots}{are for further arguments, such as \code{method} and \code{p}, passed to the \code{\link[stats]{dist}} function, used in \code{covNii} only}
}
\value{
A \code{vector} of length \eqn{k} whose entries are the variances of the self entries (i.e., first column) in a
species correspondence contingency table (SCCT).

The \eqn{k \times k} covariance matrix of cell counts \eqn{S_i} in the self (i.e., first) column of the SCCT
or of the diagonal cell counts \eqn{N_{ii}} for \eqn{i=1,\ldots,k} in the NNCT.
}
\description{
Two functions: \code{covNii.ct} and \code{covNii}.

Both functions return the covariance matrix of the self entries (i.e., first column entries) in a
species correspondence contingency table (SCCT)
but have different arguments (see the parameter list below).
The covariance matrix is of dimension \eqn{k \times k} and its entries are \eqn{cov(S_i,S_j)} where \eqn{S_i} values are
the entries in the first column of SCCT (recall that \eqn{S_i} equals diagonal entry \eqn{N_{ii}} in the NNCT).
These covariances are valid under RL or conditional on \eqn{Q} and \eqn{R} under CSR.

The argument \code{ct} which is used in \code{covNii.ct} only, can be either the NNCT or SCCT.
And the argument \code{Vsq} is the vector of variances of the diagonal entries \eqn{N_{ii}} in the NNCT or the self entries
(i.e., the first column) in the SCCT.

See also (\insertCite{ceyhan:NNCorrespond2018;textual}{nnspat}).
}
\examples{
n<-20  #or try sample(1:20,1)
Y<-matrix(runif(3*n),ncol=3)
ipd<-ipd.mat(Y)
cls<-sample(1:2,n,replace = TRUE)  #or try cls<-rep(1:2,c(10,10))
ct<-nnct(ipd,cls)

W<-Wmat(ipd)
Qv<-Qvec(W)$q
Rv<-Rval(W)

vsq<-varNii.ct(ct,Qv,Rv)
covNii(Y,cls)
covNii.ct(ct,vsq,Qv,Rv)

covNii(Y,cls,method="max")

#cls as a factor
na<-floor(n/2); nb<-n-na
fcls<-rep(c("a","b"),c(na,nb))
ct<-nnct(ipd,fcls)

covNii(Y,fcls)
covNii.ct(ct,vsq,Qv,Rv)

#############
n<-40
Y<-matrix(runif(3*n),ncol=3)
ipd<-ipd.mat(Y)
cls<-sample(1:4,n,replace = TRUE)  #or try cls<-rep(1:2,c(10,10))
ct<-nnct(ipd,cls)

W<-Wmat(ipd)
Qv<-Qvec(W)$q
Rv<-Rval(W)

vsq<-varNii.ct(ct,Qv,Rv)
covNii(Y,cls)
covNii.ct(ct,vsq,Qv,Rv)

}
\references{
\insertAllCited{}
}
\seealso{
\code{\link{scct}}, \code{\link{cov.nnct}}, \code{\link{cov.tct}} and \code{\link{cov.nnsym}}
}
\author{
Elvan Ceyhan
}
