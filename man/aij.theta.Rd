% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NNCTFunctions.R
\name{aij.theta}
\alias{aij.theta}
\title{Closeness or Proximity Matrix for Tango's Spatial Clustering Tests}
\usage{
aij.theta(dat, theta, model = "exp.clinal", ...)
}
\arguments{
\item{dat}{The data set in one or higher dimensions, each row corresponds to a data point.}

\item{theta}{A predetermined cluster scale so that any pair of cases farther apart then the distance 
\eqn{\theta} is unlikely to be cluster.}

\item{model}{Type of Tango's spatial clustering model with four options: 
\code{NN}, \code{exp.clinal} (default), \code{exponential}, and \code{hot.spot}.}

\item{\dots}{are for further arguments, such as \code{method} and \code{p}, passed to the \code{\link[stats]{dist}} function.}
}
\value{
The \eqn{A=a_{ij}(\theta)} matrix useful in calculations for Tango's test \eqn{T(\theta)}.
}
\description{
This function computes the \eqn{A=a_{ij}(\theta)} matrix useful in calculations for Tango's test \eqn{T(\theta)} 
for spatial (disease) clustering (see Eqn (2) of \insertCite{tango:2007;textual}{nnspat}.
Here, \eqn{A=a_{ij}(\theta)} is any matrix of a measure of the closeness between two points \eqn{i} and \eqn{j} with \eqn{aii = 0} for all
\eqn{i = 1, \ldots,n}, and \eqn{\theta = (\theta_1,\ldots,\theta_p)^t} denotes the unknown parameter vector related 
to cluster size and \eqn{\delta = (\delta_1,\ldots,\delta_n)^t}, where \eqn{\delta_i=1} if \eqn{z_i} is a case and 0 
otherwise.
The test is then
\deqn{T(\theta)=\sum_{i=1}^n\sum_{j=1}^n\delta_i \delta_j a_{ij}(\theta)=\delta^t A(\theta) \delta}
where \eqn{A=a_{ij}(\theta)}.

\eqn{T(\theta)} becomes Cuzick and Edwards \eqn{T_k} tests statistic (\insertCite{cuzick:1990;textual}{nnspat}),
if \eqn{a_{ij}=1} if \eqn{z_j} is among the \code{k}NNs of \eqn{z_i} and 0 otherwise.
In this case \eqn{\theta=k} and \code{aij.theta} becomes \code{aij.mat} (more specifically,
\code{aij.mat(dat,k)} and \code{aij.theta(dat,k,model="NN")}.

In Tango's exponential clinal model (\insertCite{tango:2000;textual}{nnspat}),
\eqn{a_{ij}=\exp\left(-4 \left(\frac{d_{ij}}{\theta}\right)^2\right)} if \eqn{i \ne j}  and 0 otherwise,
where \eqn{\theta} is a predetermined scale of cluster such that any pair of cases far apart beyond the distance 
\eqn{\theta} cannot be considered as a cluster and \eqn{d_{ij}} denote the Euclidean distance between 
two points \eqn{i} and \eqn{j}. 

In the exponential model (\insertCite{tango:2007;textual}{nnspat}),
\eqn{a_{ij}=\exp\left(-\frac{d_{ij}}{\theta}\right)} if \eqn{i \ne j}  and 0 otherwise,
where \eqn{\theta} and \eqn{d_{ij}} are as above.

In the hot-spot model (\insertCite{tango:2007;textual}{nnspat}),
\eqn{a_{ij}=1} if \eqn{d_{ij} \le \theta} and \eqn{i \ne j}  and 0 otherwise,
where \eqn{\theta} and \eqn{d_{ij}} are as above.

The argument \code{model} has four options, \code{NN}, \code{exp.clinal}, \code{exponential}, and 
\code{hot.spot}, with \code{exp.clinal} being the default.
And the \code{theta} argument specifies the scale of clustering or the clustering parameter in the particular
spatial disease clustering model.

See also (\insertCite{tango:2007;textual}{nnspat}) and the references therein.
}
\examples{
n<-20  #or try sample(1:20,1)
Y<-matrix(runif(3*n),ncol=3)
k<-3#1 #try also 2,3

#aij for CE's Tk
Aij<-aij.theta(Y,k,model = "NN")
Aij2<-aij.mat(Y,k)
sum(abs(Aij-Aij2)) #check equivalence of aij.theta and aij.mat with model="NN"

Aij<-aij.theta(Y,k,method="max")
Aij2<-aij.mat(Y,k)
range(Aij-Aij2)

theta=.2
aij.theta(Y,theta,model = "exp.clinal")
aij.theta(Y,theta,model = "exponential")
aij.theta(Y,theta,model = "hot.spot")

}
\references{
\insertAllCited{}
}
\seealso{
\code{\link{aij.mat}}, \code{\link{aij.nonzero}} and \code{\link{ceTk}}
}
\author{
Elvan Ceyhan
}
