#!/bin/bash
module load vg/1.46.0


data=$input_path/*_R1_P.fastq.gz
input_folder=$input_path
output=$out_path
index=$input_path2/3ST_pggb0.5.3_256.gcsa
basename=$input_path2/3ST_pggb0.5.3_256

for f in $data
do


x=$(basename $f _R1_P.fastq.gz)
echo ${x}

read1=${x}_R1_P.fastq.gz
read2=$(echo $read1|sed 's/_R1_P.fastq.gz/_R2_P.fastq.gz/')

echo $read2


vg map -t 20  -d $basename -g $index  -f $input_folder/$read1 -f $input_folder/$read2 -N $x  > $output/${x}vgmap_3ST.gam
vg stats -a  $output/${x}vgmap_3ST.gam  >$output/${x}vgmap_3ST_stats 


done


