# This function is used for a specific case:
# This function will combine two time trees (phylo objects) into a single time tree (phylo object) if both trees are mutually exclusive clades. In other words, neither clade renders the other paraphyletic.
# Combining these trees cannot use the bind.tip() function alone, because the root node of the MRCA of the two trees is not present in either tree.
# To combine these trees, I have written a function that generates a base tree with the correct edge lengths and then binds the root nodes of both trees to those placeholder tips.
# As far as I know, there wasn't a simple way to do this already.

join.sister.trees <- function(tree.x,tree.y,root.age) {
# Checks:
if (!inherits(tree.x, "phylo")) 
        stop("tree.x should be an object of class \"phylo\".")
if (!inherits(tree.y, "phylo")) 
        stop("tree.y should be an object of class \"phylo\".")
basetree_treeX_branch <- root.age - max(nodeHeights(tree.x))
if (! basetree_treeX_branch > 0)
        stop("root.age for the new tree must be older than the root age of tree.x")
basetree_treeY_branch <- root.age - max(nodeHeights(tree.y))
if (! basetree_treeX_branch > 0)
        stop("root.age for the new tree must be older than the root age of tree.y")

# Generate a base tree to bind the two trees two

basetree <- read.tree(text=paste("(treeX:",basetree_treeX_branch,",treeY:",basetree_treeY_branch,");",sep=""))

# bind the trees to the base tree
basetree_tmp <- bind.tree(basetree,tree.x,which("treeX"==basetree$tip.label))
basetree_result <- bind.tree(basetree_tmp,tree.y,which("treeY"==basetree_tmp$tip.label))
return(basetree_result)
}
