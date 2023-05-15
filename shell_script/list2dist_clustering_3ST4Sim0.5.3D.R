#library(devtools)
#install_github("helixcn/spaa")
#library(spaa)
#install.packages("reshape")
setwd("/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pggb_0.5.3_MS/distance_cluster_VS_SNPsTree")


library(reshape)
library(ape)

# read in the data
dat=read.csv("130NM_10k95_0.5.3D_distance_cut",sep="\t")
dat
# use reshape's cast function to change to matrix
m <- cast(dat, group.a ~ group.b)
m
# set the row names
rownames(m) <- m[,1]
rownames(m)

#The fellowing two lines code will cause no IDs in the clustering 
# get rid of a couple of rows
m <- m[,-2]
# convert any 0s that were read in as strings to integers
m <- apply(m, 2, as.numeric )
m

# change the matrix to a distance matrix
d <- dist(m)
d

# do hierarchical clustering
h <- hclust(d)

h
# plot the dendrogram
plot(h)

# use ape's as phylo function
tree <- as.phylo(h)
# export as newick for viewing in figtree
write.tree(phy=tree, file = '130NM_distance.tree')