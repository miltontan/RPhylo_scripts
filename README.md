# RPhylo_scripts
Some scripts for manipulating data for phylogenetics in R

# Dependencies
- ape
- phytools

# Brief description:
- getDescendantTip: Given a node number, get only the descendant tips (as opposed to all descendant nodes as in phytools::getDescendants). Returns tipnames by default, otherwise set tipnames = FALSE for the tip numbers (i.e. phy$tip.label index)
- getDescendantTips: Same as getDescendantTip, but for a vector of node numbers or all nodes in a phylo object.
- getMRCAorParent: ape::getMRCA only works for two or more tips. To get the parental node of a single tip or the MRCA of multiple taxa, you can use this. For example, if you wanted to identify clades in the tree for sets of taxa so that you can color the branches of clades throughout a tree, you might still want to color a clade that is only represented by a single tip name. This function uses ape::getMRCA unless a group is represented by a single tip name, in which case it calls phytools::getParent. 
- getMRCAorTip: The inverse of getMRCAorParent is if you want the tip's node number (e.g. position in phy$tip.label) for each tip. Like getMRCAorParent, the default behavior for when there is more than one tip name in a set of taxa is to call ape::getMRCA directly, otherwise it returns the tip ID.
- join.sister.trees: Join two clades together as sister clades with a designated root age.
- reroot50: In FigTree, the default behavior of rooting is to place the root halfway down the selected branch. This replicates that behavior in R by calling phytools::reroot.