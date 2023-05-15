#!/bin/bash

module load bowtie2/2.4.5
module load samtools/1.4
module load picard/2.10.10
data=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/graph149_data/ST154forgraph_datalink/*_R1_P.fastq.gz
input_folder=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/graph149_data/ST154forgraph_datalink
output=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/mapping_graph_ref_3ST/bowtie2_alignmentST154_ST154
output_unmaped=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/mapping_graph_ref_3ST/bowtie2_alignmentST154_ST154/unmapped
ref=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/mapping_refs/NMI97348_restart




for f in $data
do

echo ${x}

read1=${x}_R1_P.fastq.gz
read2=$(echo $read1|sed 's/_R1_P.fastq.gz/_R2_P.fastq.gz/')

echo $read2

bowtie2 -p 20 -X 2000 --local -x $ref -1 $input_folder/$read1 -2 $input_folder/$read2  $output_unmaped/${x}_un.fastq -S $output/${x}.sam 2>&1 | tee $output/${x}log.txt

picard SortSam INPUT=$output/${x}.sam OUTPUT=$output/${x}_s.bam SORT_ORDER=coordinate 2>>$output/${x}log.txt 

rm $output/${x}.sam 

picard MarkDuplicates INPUT=$output/${x}_s.bam OUTPUT=$output/${x}_mds.bam Metrics_FILE=$output/${x}metrics.txt 2>>${x}log_mds.txt



picard AddOrReplaceReadGroups INPUT=$output/${x}_mds.bam OUTPUT=$output/${x}.bam RGID=${x} RGSM=${x} RGLB=${x} RGPU=1 RGPL=illumin 2>>${x}log.txt 

samtools index  $output/${x}.bam 


done
