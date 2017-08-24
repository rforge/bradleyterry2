#' Seed Germination Data from Crowder (1978)
#' 
#' Data from Crowder(1978) giving the proportion of seeds germinated for 21
#' plates that were arranged according to a 2x2 factorial layout by seed
#' variety and type of root extract.
#' 
#' 
#' @name seeds
#' @docType data
#' @format A data frame with 21 observations on the following 4 variables.
#' \describe{
#' \item{r}{the number of germinated seeds.}
#' \item{n}{the total number of seeds.} 
#' \item{seed}{the seed
#' variety.} 
#' \item{extract}{the type of root extract.} }
#' @seealso \code{\link{glmmPQL}}
#' @references Breslow, N. E. and Clayton, D. G. (1993) Approximate inference
#' in Generalized Linear Mixed Models. \emph{Journal of the American
#' Statistical Association}, \bold{88}(421), 9--25.
#' @source Crowder, M. (1978) Beta-Binomial ANOVA for proportions.
#' \emph{Applied Statistics}, \bold{27}, 34--37.
#' @keywords datasets
#' @examples
#' 
#' attach(seeds)
#' 
#' summary(glmmPQL(cbind(r, n - r) ~ seed + extract,
#'         random = diag(length(r)),
#'         family = binomial))
#' 
"seeds"