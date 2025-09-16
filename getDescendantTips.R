# R functions created by Milton Tan
# Depends on ape and phytools

getDescendantTip <- function(phy, node, tipnames = TRUE) {
  if (!inherits(phy, "phylo")) {
    stop("object \"phy\" is not of class \"phylo\"")
    }
  alldesc <- phytools::getDescendants(phy, node)
  tipdesc <- alldesc[ alldesc <= length(phy$tip.label) ]
  if(tipnames) {
      tipdesc <- phy$tip.label[ tipdesc ]
  }
  tipdesc
}

getDescendantTips <- function(phy, node = NULL, tipnames = TRUE) {
  if (is.null(node)) {
    node <- 1:phy$Nnode+length(phy$tip.label)
  }
  if (is.numeric(node)) {
      if (all(node > length(phy$tip.label) & node <= phy$Nnode+length(phy$tip.label)) ) {
        lapply(node, \(nd) getDescendantTip(phy, node = nd, tipnames = tipnames))
      } else {
        stop("object \"node\" must contain node numbers in allowable range (between the number of tips + 1 and the number of tips + the number of nodes)")
      }
    } else {
      stop("object \"node\" must contain node numbers.")
    }
}