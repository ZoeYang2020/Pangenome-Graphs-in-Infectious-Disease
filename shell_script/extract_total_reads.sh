#!/bin/bash

for sample in bowtie2_alignmentST154_ST154 bowtie2_alignmentST154_ST41 bowtie2_alignmentST154_ST42 bowtie2_alignmentST41_ST154 bowtie2_alignmentST41_ST41 bowtie2_alignmentST41_ST42 bowtie2_alignmentST42_ST154 bowtie2_alignmentST42_ST41 bowtie2_alignmentST42_ST42 

do

echo ${sample} 

data=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/mapping_graph_ref_3ST/${sample}_bamqc/*.html 
in_file=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/mapping_graph_ref_3ST/${sample}_bamqc
out_file=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/mapping_graph_ref_3ST/mapping_rate


for f in $data
do

x=$(basename $f qualimapReport.html)
echo ${x}

cd $in_file/${x}
echo ${x}>${x}_total_reads
head -20 genome_results.txt  |tail -1 >>${x}_total_reads
cd ..
cat $in_file/${x}/${x}_total_reads >>$out_file/${sample}_total_reads
done

done 
