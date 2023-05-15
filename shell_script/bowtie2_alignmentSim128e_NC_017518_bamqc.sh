#!/bin/bash


#set link to bamqc, data, in_file, out_file


bamqc=$path/qualimap_v2.2.1/qualimap
data=$in_file/*.bam
in_file=$path to in_file
out_file=$path to our_file
       

for f in $data
do

x=$(basename $f .bam)
echo ${x}

$bamqc bamqc  -bam $in_file/${x}.bam -outdir $out_file/${x}  
cp $out_file/${x}/qualimapReport.html $out_file/${x}qualimapReport.html

done
