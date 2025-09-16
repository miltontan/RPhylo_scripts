# R function created by Milton Tan
# Depends on ape and phytools

# Get node label even if you provide only a single tip
getMRCAorParent <- function(phy, tip) {
  if (!inherits(phy, "phylo")) 
    stop("object \"phy\" is not of class \"phylo\"")
  if (! all(tip %in% phy$tip.label)) {
    stop("the following tip labels are not in object \"phy\":\n",
         tip[ ! tip %in% phy$tip.label ])
  }
  if (length(tip) == 1) {
    if (! is.numeric(tip)) {
      tip <- which(phy$tip.label %in% tip)
    }
    nd <- phytools::getParent(phy, tip)
  } else {
    nd <- ape::getMRCA(phy, tip) 
  }
  return(nd)
}

getMRCAorTip <- function(phy, tip) {
  if (!inherits(phy, "phylo")) 
    stop("object \"phy\" is not of class \"phylo\"")
  if (! all(tip %in% phy$tip.label)) { 
    stop("the following tip labels are not in object \"phy\":\n",
         tip[ ! tip %in% phy$tip.label ])
  } 
  if (length(tip) == 1) {
    tip <- which(phy$tip.label %in% tip)
  } else {
    nd <- ape::getMRCA(phy, tip) 
  }
  return(nd)
}