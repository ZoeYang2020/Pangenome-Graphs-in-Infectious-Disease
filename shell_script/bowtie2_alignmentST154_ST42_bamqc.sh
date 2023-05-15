#!/bin/bash

bamqc=/home/zyang/tools/qualimap_v2.2.1/qualimap
data=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/mapping_graph_ref_3ST/bowtie2_alignmentST154_ST42/*.bam
in_file=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/mapping_graph_ref_3ST/bowtie2_alignmentST154_ST42
out_file=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/mapping_graph_ref_3ST/bowtie2_alignmentST154_ST42_bamqc
       

for f in $data
do

x=$(basename $f .bam)
echo ${x}

$bamqc bamqc  -bam $in_file/${x}.bam -outdir $out_file/${x}  
cp $out_file/${x}/qualimapReport.html $out_file/${x}qualimapReport.html

done
