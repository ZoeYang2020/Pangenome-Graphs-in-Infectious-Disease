#!/bin/bash
input=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pggb_0.5.3_MS/distance_cluster_VS_SNPsTree/ska/ska_NM130_variants_rename.aln
x=$(basename $input .aln)
echo ${x}
perl convertAlignment.pl -i  $input -o ./${x}.phylip -f phylip


