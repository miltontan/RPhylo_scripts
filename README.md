# RPhylo_scripts
Some scripts for manipulating data for phylogenetics in R

# Dependencies
- ape
- phytools

# Loading Functions
You can use these scripts by downloading individual script functions, or cloning the whole repository. Use source() on individual files, or use the following by directing the path to your cloned repository.

```
fxns <- list.files("path/to/RPhylo_scripts", full.names = TRUE)
invisible(lapply(fxns, source))
```

# Usage
- getDescendantTip: Get the descendant tips of a given node number. This is based on phytools::getDescendants, which returns all descendant node and tip numbers of a node, but sometimes you want just the tip names. Returns tip names by default, otherwise set tipnames = FALSE for the tip numbers (i.e. phy$tip.label indices).
- getDescendantTips: Same as getDescendantTip, but for a vector of node numbers or all nodes in a phylo object.
- getMRCAorParent: ape::getMRCA only works for two or more tips. For one tip, you might be surprised when getMRCA fails. This makes it difficult to loop getMRCA over multiple sets of taxa. For example, if you had multiple sets of taxa, some with one tip and some with multiple tips, you may want to identify clades in the tree so that you can color the branches of clades, even for a clade that is only represented by a single tip name. This can be solved using this function. This function calls ape::getMRCA unless a group is represented by a single tip name, in which case it calls phytools::getParent. 
- getMRCAorTip: like getMRCAorParent, but if you want groups defined by a single tip name to return the tip's node number instead (i.e. index in phy$tip.label). Like getMRCAorParent, the default behavior for when there is more than one tip name in a set of taxa is to call ape::getMRCA directly, otherwise it returns the tip ID.
- join.sister.trees: Join two clades together as sister clades with a designated root age.
- phy2lin: If you have to use [LINTRE](http://www.kms.ac.jp/~genomelb/takezaki/lintre/index.html) and want to provide a tree rather than letting it infer one, you can convert a phylo object into the tabular LINTRE format for trees.
- reroot50: In FigTree, the default behavior of rooting is to place the root halfway along the selected branch. This replicates that behavior in R by calling phytools::reroot.