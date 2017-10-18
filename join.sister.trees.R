# This function is used for a specific case:
# This function will combine two time trees (phylo objects) into a single time tree (phylo object) if both trees are mutually exclusive clades. They will be joined in the resulting tree as sister clades.
# Combining these trees cannot use the bind.tip() function alone, because the age of the MRCA of the two trees is not necessarily present in either tree.
# To combine these trees, I have written a function that computes the length that the root.edge has to be for both trees so that they can be bound by their root nodes, and computes the correct position argument for the bind.tree function. This is intuitively simple but I figured it'd be easier to write a function than explain how to do it.
# As far as I know, there wasn't a simple way to do this already.

# Note: In the previous version, I didn't realize how binding a tree to a non-zero root.edge worked, but it looks like the below should work.

join.sister.trees <- function(tree.x,tree.y,root.age) {
# Checks:
if (!inherits(tree.x, "phylo")) 
        stop("tree.x should be an object of class \"phylo\".")
if (!inherits(tree.y, "phylo")) 
        stop("tree.y should be an object of class \"phylo\".")
tree.x.root <- root.age - max(nodeHeights(tree.x))
if (! tree.x.root > 0)
        stop("root.age for the new tree must be older than the crown age of tree.x")
tree.y.root <- root.age - max(nodeHeights(tree.y))
if (! tree.y.root > 0)
        stop("root.age for the new tree must be older than the crown age of tree.y")

# Replace the root.edge ages for tree.x for binding tree.y.
tree.x$root.edge <- tree.x.root
tree.y$root.edge <- tree.y.root

# Bind the trees to the base tree
result.tree <- bind.tree(tree.x,tree.y,where="root",position=tree.x.root)
return(result.tree)
}
