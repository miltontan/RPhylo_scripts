# RPhylo_scripts
Some scripts for manipulating data for phylogenetics in R

# Dependencies
- ape
- phytools

# Brief description:
- getMRCAorParent: ape::getMRCA only works for two or more tips. To get the parental node of a single tip or the MRCA of multiple taxa, you can use this. For example, this would allow you to more easily identify the parental node needed to select all descendant branches to highlight clades in a tree using phytools::getParent, otherwise, ape::getMRCA is directly called for more than one tip.
- getMRCAorTip: The inverse of getMRCAorParent is if you want the tip's node number (e.g. position in phy$tip.label) for each tip. Like getMRCAorParent, the default behavior for when there is more than one tip in a set of taxa is to call ape::getMRCA directly.
- join.sister.trees: Join two clades together as sister clades with a designated root age.
- reroot50: In FigTree, the default behavior of rooting is to place the root halfway down the selected branch. This replicates that behavior in R by calling phytools::reroot.