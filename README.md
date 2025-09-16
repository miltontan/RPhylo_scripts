# RPhylo_scripts
Some scripts for manipulating data for phylogenetics in R

# Dependencies
- ape
- phytools

# Brief description:
- getDescendantTip: Get the descendant tips of a given node number. This is based on phytools::getDescendants, which returns all descendant node and tip numbers of a node, but sometimes you just want the tips. Returns tipnames by default, otherwise set tipnames = FALSE for the tip numbers (i.e. phy$tip.label indices)
- getDescendantTips: Same as getDescendantTip, but for a vector of node numbers or all nodes in a phylo object.
- getMRCAorParent: ape::getMRCA only works for two or more tips. For one tip, it is somewhat unexpected that the behavior is failure. For example, if you had multiple sets of taxa, some with one tip and some with multiple tips, you may want to identify clades in the tree so that you can color the branches of clades, even for a clade that is only represented by a single tip name. This can be solved using this function. This function calls ape::getMRCA unless a group is represented by a single tip name, in which case it calls phytools::getParent. 
- getMRCAorTip: The inverse of getMRCAorParent is if you want the tip's node number (e.g. position in phy$tip.label) for each tip. Like getMRCAorParent, the default behavior for when there is more than one tip name in a set of taxa is to call ape::getMRCA directly, otherwise it returns the tip ID.
- join.sister.trees: Join two clades together as sister clades with a designated root age.
- reroot50: In FigTree, the default behavior of rooting is to place the root halfway along the selected branch. This replicates that behavior in R by calling phytools::reroot.