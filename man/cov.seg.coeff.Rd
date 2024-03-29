% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NNCTFunctions.R
\name{cov.seg.coeff}
\alias{cov.seg.coeff}
\title{Covariance Matrix of Segregation Coefficients in a Multi-class Case}
\usage{
cov.seg.coeff(ct, covN)
}
\arguments{
\item{ct}{A nearest neighbor contingency table}

\item{covN}{The \eqn{k^2 \times k^2} covariance matrix of row-wise vectorized entries of NNCT}
}
\value{
The \eqn{k(k+1)/2} x \eqn{k(k+1)/2} covariance matrix of the segregation coefficients for the multi-class case
based on the NNCT, \code{ct}
}
\description{
Returns the covariance matrix of the segregation coefficients in a multi-class case based on
the NNCT, \code{ct}. The covariance matrix is of dimension \eqn{k(k+1)/2 \times k(k+1)/2} and its entry \eqn{i,j} correspond to the
entries in the rows \eqn{i} and \eqn{j} of the output of \code{\link{ind.seg.coeff}(k)}. 
The segregation coefficients in the multi-class case are the extension of Pielou's segregation coefficient
for the two-class case.
These covariances are valid under RL or conditional on \eqn{Q} and \eqn{R} under CSR.

The argument \code{covN} is the covariance matrix of \eqn{N_{ij}} (concatenated rowwise).

See also (\insertCite{ceyhan:SiM-seg-ind2014;textual}{nnspat}).
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
varN<-var.nnct(ct,Qv,Rv)
covN<-cov.nnct(ct,varN,Qv,Rv)

cov.seg.coeff(ct,covN)

#cls as a factor
na<-floor(n/2); nb<-n-na
fcls<-rep(c("a","b"),c(na,nb))
ct<-nnct(ipd,fcls)

cov.seg.coeff(ct,covN)

#############
n<-40
Y<-matrix(runif(3*n),ncol=3)
cls<-sample(1:4,n,replace = TRUE)  #or try cls<-rep(1:2,c(10,10))
ipd<-ipd.mat(Y)
ct<-nnct(ipd,cls)

W<-Wmat(ipd)
Qv<-Qvec(W)$q
Rv<-Rval(W)
varN<-var.nnct(ct,Qv,Rv)
covN<-cov.nnct(ct,varN,Qv,Rv)

cov.seg.coeff(ct,covN)

}
\references{
\insertAllCited{}
}
\seealso{
\code{\link{seg.coeff}}, \code{\link{var.seg.coeff}}, \code{\link{cov.nnct}}
and \code{\link{cov.nnsym}}
}
\author{
Elvan Ceyhan
}
