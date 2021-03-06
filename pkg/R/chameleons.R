#' Male Cape Dwarf Chameleons: Measured Traits and Contest Outcomes
#' 
#' Data as used in the study by Stuart-Fox et al. (2006).  Physical
#' measurements made on 35 male Cape dwarf chameleons, and the results of 106
#' inter-male contests.
#' 
#' The published paper mentions 107 contests, but only 106 contests are
#' included here.  Contest number 16 was deleted from the data used to fit the
#' models, because it involved a male whose predictor-variables were incomplete
#' (and it was the only contest involving that lizard, so it is uninformative).
#' 
#' @name chameleons
#' @docType data
#' @format A list containing three data frames: `chameleons$winner`,
#' `chameleons$loser` and `chameleons$predictors`.
#' 
#' The `chameleons$winner` and `chameleons$loser` data frames each
#' have 106 observations (one per contest) on the following 4 variables:
#' \describe{ 
#' \item{ID}{a factor with 35 levels `C01`, `C02`,
#' ... , `C43`, the identity of the winning (or losing) male in each
#' contest} 
#' \item{prev.wins.1}{integer (values 0 or 1), did the
#' winner/loser of this contest win in an immediately previous contest?}
#' \item{prev.wins.2}{integer (values 0, 1 or 2), how many of his
#' (maximum) previous 2 contests did each male win?}
#' \item{prev.wins.all}{integer, how many previous contests has each
#' male won?} }
#' 
#' The `chameleons$predictors` data frame has 35 observations, one for
#' each male involved in the contests, on the following 7 variables: 
#' \describe{
#' \item{ch.res}{numeric, residuals of casque height regression on
#' `SVL`, i.e. relative height of the bony part on the top of the
#' chameleons' heads} 
#' \item{jl.res}{numeric, residuals of jaw length
#' regression on `SVL`} 
#' \item{tl.res}{numeric, residuals of tail
#' length regression on `SVL`}
#' \item{mass.res}{numeric, residuals
#' of body mass regression on `SVL` (body condition)}
#' \item{SVL}{numeric, snout-vent length (body size)}
#' \item{prop.main}{numeric, proportion (arcsin transformed) of area of
#' the flank occupied by the main pink patch on the flank}
#' \item{prop.patch}{numeric, proportion (arcsin transformed) of area
#' of the flank occupied by the entire flank patch} }
#' @author David Firth
#' @source The data were obtained by Dr Devi Stuart-Fox,
#' http://www.zoology.unimelb.edu.au/research/groups/animal/labs/stuart-fox/index.php,
#' and they are reproduced here with her kind permission.
#' 
#' These are the same data that were used in
#' 
#' Stuart-Fox, D. M., Firth, D., Moussalli, A. and Whiting, M. J. (2006)
#' Multiple signals in chameleon contests: designing and analysing animal
#' contests as a tournament. *Animal Behaviour* **71**, 1263--1271.
#' @keywords datasets
#' @examples
#' 
#' ##
#' ## Reproduce Table 3 from page 1268 of the above paper:
#' ##
#' summary(chameleon.model <- BTm(player1 = winner, player2 = loser,
#'   formula = ~ prev.wins.2 + ch.res[ID] + prop.main[ID] + (1|ID), id = "ID",
#'   data = chameleons))
#' head(BTabilities(chameleon.model))
#' ##
#' ## Note that, although a per-chameleon random effect is specified as in the
#' ## above [the term "+ (1|ID)"], the estimated variance for that random
#' ## effect turns out to be zero in this case.  The "prior experience"
#' ## effect ["+ prev.wins.2"] in this analysis has explained most of the
#' ## variation, leaving little for the ID-specific predictors to do.
#' ## Despite that, two of the ID-specific predictors do emerge as
#' ## significant.
#' ##
#' ## Test whether any of the other ID-specific predictors has an effect:
#' ##
#' add1(chameleon.model, ~ . + jl.res[ID] + tl.res[ID] + mass.res[ID] +
#'   SVL[ID] + prop.patch[ID]) 
#' 
"chameleons"
