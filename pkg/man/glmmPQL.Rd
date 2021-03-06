% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/glmmPQL.R
\name{glmmPQL}
\alias{glmmPQL}
\title{PQL Estimation of Generalized Linear Mixed Models}
\usage{
glmmPQL(fixed, random = NULL, family = "binomial", data = NULL,
  subset = NULL, weights = NULL, offset = NULL, na.action = NULL,
  start = NULL, etastart = NULL, mustart = NULL,
  control = glmmPQL.control(...), sigma = 0.1, sigma.fixed = FALSE,
  model = TRUE, x = FALSE, contrasts = NULL, ...)
}
\arguments{
\item{fixed}{a formula for the fixed effects.}

\item{random}{a design matrix for the random effects, with number of rows
equal to the length of variables in \code{formula}.}

\item{family}{a description of the error distribution and link function to
be used in the model. This can be a character string naming a family
function, a family function or the result of a call to a family function.
(See \code{\link[=family]{family()}} for details of family functions.)}

\item{data}{an optional data frame, list or environment (or object coercible
by \code{\link[=as.data.frame]{as.data.frame()}} to a data frame) containing the variables in
the model.  If not found in \code{data}, the variables are taken from
\code{environment(formula)}, typically the environment from which
\code{glmmPQL} called.}

\item{subset}{an optional logical or numeric vector specifying a subset of
observations to be used in the fitting process.}

\item{weights}{an optional vector of \sQuote{prior weights} to be used in
the fitting process.}

\item{offset}{an optional numeric vector to be added to the linear predictor
during fitting. One or more \code{offset} terms can be included in the
formula instead or as well, and if more than one is specified their sum is
used.  See \code{\link[=model.offset]{model.offset()}}.}

\item{na.action}{a function which indicates what should happen when the data
contain \code{NA}s.  The default is set by the \code{na.action} setting of
\code{\link[=options]{options()}}, and is \code{\link[=na.fail]{na.fail()}} if that is unset.}

\item{start}{starting values for the parameters in the linear predictor.}

\item{etastart}{starting values for the linear predictor.}

\item{mustart}{starting values for the vector of means.}

\item{control}{a list of parameters for controlling the fitting process.
See the \code{\link[=glmmPQL.control]{glmmPQL.control()}} for details.}

\item{sigma}{a starting value for the standard deviation of the random
effects.}

\item{sigma.fixed}{logical: whether or not the standard deviation of the
random effects should be fixed at its starting value.}

\item{model}{logical: whether or not the model frame should be returned.}

\item{x}{logical: whether or not the design matrix for the fixed effects
should be returned.}

\item{contrasts}{an optional list. See the \code{contrasts.arg} argument of
\code{\link[=model.matrix]{model.matrix()}}.}

\item{\dots}{arguments to be passed to \code{\link[=glmmPQL.control]{glmmPQL.control()}}.}
}
\value{
An object of class \code{"BTglmmPQL"} which inherits from
\code{"glm"} and \code{"lm"}: \item{coefficients}{ a named vector of
coefficients, with a \code{"random"} attribute giving the estimated random
effects.} \item{residuals}{ the working residuals from the final iteration
of the IWLS loop.} \item{random}{the design matrix for the random effects.}
\item{fitted.values}{ the fitted mean values, obtained by transforming the
linear predictors by the inverse of the link function.} \item{rank}{the
numeric rank of the fitted linear model.} \item{family}{the \code{family}
object used.} \item{linear.predictors}{the linear fit on link scale.}
\item{deviance}{up to a constant, minus twice the maximized log-likelihood.}
\item{aic}{a version of Akaike's \emph{An Information Criterion}, minus
twice the maximized log-likelihood plus twice the number of parameters,
computed by the \code{aic} component of the family.}
\item{null.deviance}{the deviance for the null model, comparable with
\code{deviance}.} \item{iter}{the numer of iterations of the PQL algorithm.}
\item{weights}{the working weights, that is the weights in the final
iteration of the IWLS loop.} \item{prior.weights}{the weights initially
supplied, a vector of \code{1}'s if none were.} \item{df.residual}{the
residual degrees of freedom.} \item{df.null}{the residual degrees of freedom
for the null model.} \item{y}{if requested (the default) the \code{y} vector
used. (It is a vector even for a binomial model.)} \item{x}{if requested,
the model matrix.} \item{model}{if requested (the default), the model
frame.} \item{converged}{logical. Was the PQL algorithm judged to have
converged?} \item{call}{the matched call.} \item{formula}{the formula
supplied.} \item{terms}{the \code{terms} object used.} \item{data}{the
\code{data} argument used.} \item{offset}{the offset vector used.}
\item{control}{the value of the \code{control} argument used.}
\item{contrasts}{(where relevant) the contrasts used.} \item{xlevels}{(where
relevant) a record of the levels of the factors used in fitting.}
\item{na.action}{(where relevant) information returned by \code{model.frame}
on the special handling of \code{NA}s.} \item{sigma}{the estimated standard
deviation of the random effects} \item{sigma.fixed}{logical: whether or not
\code{sigma} was fixed} \item{varFix}{the variance-covariance matrix of the
fixed effects} \item{varSigma}{the variance of \code{sigma}}
}
\description{
Fits GLMMs with simple random effects structure via Breslow and Clayton's
PQL algorithm.
The GLMM is assumed to be of the form \ifelse{html}{\out{g(<b>&mu;</b>) =
<b>X&beta;</b> + <b>Ze</b>}}{\deqn{g(\boldsymbol{\mu}) = \boldsymbol{X\beta}
+ \boldsymbol{Ze}}{ g(mu) = X * beta + Z * e}} where \eqn{g} is the link
function, \ifelse{html}{\out{<b>&mu;</b>}}{\eqn{\boldsymbol{\mu}}{mu}} is the
vector of means and \ifelse{html}{\out{<b>X</b>, <b>Z</b>}}{\eqn{\boldsymbol{X},
\boldsymbol{Z}}{X,Z}} are design matrices for the fixed effects
\ifelse{html}{\out{<b>&beta;</b>}}{\eqn{\boldsymbol{\beta}}{beta}} and random
effects \ifelse{html}{\out{<b>e</b>}}{\eqn{\boldsymbol{e}}{e}} respectively.
Furthermore the random effects are assumed to be i.i.d.
\ifelse{html}{\out{N(0, &sigma;<sup>2</sup>)}}{\eqn{N(0, \sigma^2)}{
N(0, sigma^2)}}.
}
\examples{

###############################################
## Crowder seeds example from Breslow & Clayton
###############################################

summary(glmmPQL(cbind(r, n - r) ~ seed + extract,
        random = diag(nrow(seeds)),
        family = "binomial", data = seeds))

summary(glmmPQL(cbind(r, n - r) ~ seed*extract,
                random = diag(nrow(seeds)),
                family = "binomial", data = seeds))

}
\references{
Breslow, N. E. and Clayton, D. G. (1993) Approximate inference
in Generalized Linear Mixed Models. \emph{Journal of the American
Statistical Association} \strong{88}(421), 9--25.

Harville, D. A. (1977) Maximum likelihood approaches to variance component
estimation and to related problems. \emph{Journal of the American
Statistical Association} \strong{72}(358), 320--338.
}
\seealso{
\code{\link[=predict.BTglmmPQL]{predict.BTglmmPQL()}},\code{\link[=glmmPQL.control]{glmmPQL.control()}},\code{\link[=BTm]{BTm()}}
}
\author{
Heather Turner
}
\keyword{models}
