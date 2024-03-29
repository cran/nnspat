% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NNCTFunctions.R
\name{funsOnevsRest}
\alias{funsOnevsRest}
\alias{lab.onevsrest}
\alias{classirest}
\title{Functions for one versus rest type labeling}
\usage{
lab.onevsrest(i, lab)

classirest(i, lab)
}
\arguments{
\item{i}{label of the class that is to be retained in the post-hoc comparison.}

\item{lab}{The \code{vector} of class labels (numerical or categorical)}
}
\value{
Both functions return the data relabeled 
as class \eqn{i} label is retained and the remaining is
relabeled as "rest".
}
\description{
Two functions: \code{lab.onevsrest} and \code{classirest}.

Both functions relabel the points, 
keeping class \eqn{i} label as is and 
relabeling the other classes as "rest".
Used in the one-vs-rest type comparisons after 
the overall segregation test is found to be significant.

See also (\insertCite{ceyhan:jkss-posthoc-2017;textual}{nnspat}).
}
\examples{
n<-20  #or try sample(1:20,1)
cls<-sample(1:2,n,replace = TRUE)  #or try cls<-rep(1:2,c(10,10))
lab.onevsrest(1,cls)
classirest(2,cls)

#cls as a factor
na<-floor(n/2); nb<-n-na
fcls<-rep(c("a","b"),c(na,nb))
lab.onevsrest("a",fcls)
lab.onevsrest("b",fcls)
classirest("b",fcls)

#cls as a factor
fcls<-rep(letters[1:4],rep(10,4))
lab.onevsrest("b",fcls)
classirest("b",fcls)

}
\references{
\insertAllCited{}
}
\seealso{
\code{\link{pairwise.lab}}
}
\author{
Elvan Ceyhan
}
