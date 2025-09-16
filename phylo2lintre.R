# R function created by Milton Tan
# Depends on ape

# Make sure to properly root the tree, if needed

phy2lin <- function(tree, filename) {

ntips <- length(tree$tip.label)

filetext <- c(
  paste0("   ", ntips, " sequences"),
  sapply(1:length(tree$tip.label), \(x) paste(x, tree$tip.label[x], sep = " ") ),
  sapply(1:length(tree$edge.length),\(x) paste0(format(tree$edge[x,1], width = 3), " and ", format(tree$edge[x,2], width = 3), "        ", format(tree$edge.length)[x]))
)
write.table(filetext, file = filename, quote = FALSE, col.names = FALSE, row.names = FALSE)
}
