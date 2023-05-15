#!/bin/bash


module load ska/1.0
#input_folder=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pggb_0.5.3_MS/distance_cluster_VS_SNPsTree/ska/130_fa
#input=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pggb_0.5.3_MS/distance_cluster_VS_SNPsTree/ska/130_fa/*_genomic.restart.fasta

#for f in $input 

#do 
#x=$(basename $f _genomic.restart.fasta)
#echo ${x}

#ska fasta  $input_folder/${x}_genomic.restart.fasta -o sketches/${x}

#done 






#do
#  ska fastq -o sketches/${iso} ${R1} ${R2}
#done < isolates.tab

 

#then to do clustering:
#ska distance -i 0.95 sketches/*

 

#get summary stats for each isolate:
#ska summary sketches/*.skf > summary_ska.txt

 

#run cluster_report.R to output cluster.csv file which lists isolates in each cluster

 
#make alignment
ska align -f 130_NM_skf_list -o ska_NM130 -p 0.9 -v
