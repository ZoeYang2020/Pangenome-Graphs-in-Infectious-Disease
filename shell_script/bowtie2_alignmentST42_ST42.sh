#!/bin/bash

module load bowtie2/2.4.5
module load samtools/1.4
module load picard/2.10.10
data=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/graph149_data/ST42forgraph_datalink/*_R1_P.fastq.gz
input_folder=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/graph149_data/ST42forgraph_datalink
output=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/mapping_graph_ref_3ST/bowtie2_alignmentST42_ST42
output_unmaped=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/mapping_graph_ref_3ST/bowtie2_alignmentST42_ST42/unmapped
ref=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/mapping_refs/NC_017518


##options to define directories where the reads are
#name=''

#while getopts 'n:d:h' opt; do
#  case $opt in
#    n) name=$OPTARG ;;i
#    d) output=$OPTARG;;
#    h) echo "Usage: bash bowtie2_aligenment.sh -n <file prefix to be processed> -d <run_session_name> -h <help>"
#        exit
#        ;;
#  esac
#done


for f in $data
do

##change [common_bits_of_yourfile] common bits of your file name, delete brackets for example for processed_ARL09-165_S1_L001_R1_001.fastq, change [common_bits_of_yourfile] to _L001_R1_001.fastq, delete brackets

x=$(basename $f _R1_P.fastq.gz)
echo ${x}

read1=${x}_R1_P.fastq.gz
read2=$(echo $read1|sed 's/_R1_P.fastq.gz/_R2_P.fastq.gz/')

echo $read2

##bowtie2 align to NZ
bowtie2 -p 20 -X 2000 --local -x $ref -1 $input_folder/$read1 -2 $input_folder/$read2  $output_unmaped/${x}_un.fastq -S $output/${x}.sam 2>&1 | tee $output/${x}log.txt

picard SortSam INPUT=$output/${x}.sam OUTPUT=$output/${x}_s.bam SORT_ORDER=coordinate 2>>$output/${x}log.txt 

rm $output/${x}.sam 

picard MarkDuplicates INPUT=$output/${x}_s.bam OUTPUT=$output/${x}_mds.bam Metrics_FILE=$output/${x}metrics.txt 2>>$output/${x}log_mds.txt


#java -Xmx64g -jar /opt/bioinf/picard/picard-2.10.10/bin/picard.jar MarkDuplicates INPUT=$output/${x}_s.bam OUTPUT=$output/${x}_mds.bam Metrics_FILE=$output/${x}metrics.txt 2>>${x}log.txt

picard AddOrReplaceReadGroups INPUT=$output/${x}_mds.bam OUTPUT=$output/${x}.bam RGID=${x} RGSM=${x} RGLB=${x} RGPU=1 RGPL=illumin 2>>$output/${x}log.txt 

samtools index  $output/${x}.bam 

#java -Xmx64g -jar /opt/bioinf/picard/picard-2.10.10/bin/picard.jar BuildBamIndex INPUT=$output/${x}bam 2>>${x}log.txt 

done
