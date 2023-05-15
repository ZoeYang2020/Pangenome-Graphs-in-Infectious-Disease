#!/bin/bash
input=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pggb_0.5.3_MS/distance_cluster_VS_SNPsTree/ska/ska_NM130_variants_rename.phylip
module load iqtree2/2.0.6
iqtree2 -s $input -nt 32  -B 4000 -alrt 2000
