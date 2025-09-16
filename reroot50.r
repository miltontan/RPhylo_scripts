# R function created by Milton Tan
# Depends on ape and phytools
# Load the function:
reroot50 <- function(tree, node.number, ...) {
  pos <- .5*tree$edge.length[ which(tree$edge[,2] == node.number) ]
  phytools::reroot(tree, node.number = node.number, position = pos, edgelabel = TRUE,...)
}