#!/bin/bash
module load vg/1.46.0

data=$input_path/*R1.fq.gz
input_folder=$input_path
output=$out_path


index=$input_path1/4Sim_pggb0.5.3_256.gcsa
basename=$input_path1/4Sim_pggb0.5.3_256


for f in $data
do

##change [common_bits_of_yourfile] common bits of your file name, delete brackets for example for processed_ARL09-165_S1_L001_R1_001.fastq, change [common_bits_of_yourfile] to _L001_R1_001.fastq, delete brackets

x=$(basename $f R1.fq.gz)
echo ${x}

read1=${x}R1.fq.gz
read2=$(echo $read1|sed 's/R1.fq.gz/R2.fq.gz/')

echo $read2


vg map -t 20  -d $basename -g $index  -f $input_folder/$read1 -f $input_folder/$read2 -N $x  > $output/${x}vgmap_4Sim.gam
vg stats -a  $output/${x}vgmap_4Sim.gam  >$output/${x}vgmap_4Sim_stats 


done


