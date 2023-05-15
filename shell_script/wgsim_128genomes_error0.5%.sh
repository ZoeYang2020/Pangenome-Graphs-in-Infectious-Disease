#!/bin/bash


module load samtools/1.4

data=$path/*.fa 
input_folder=$path
output_folder=$path

for f in $data 

do

x=$(basename $f .fa)
echo ${x}

wgsim $input_folder/${x}.fa -N 1000000 -1 150 -2 150  -e 0.005 -r 0 -R 0 -X 0 $output_folder/${x}.wgsim_er0.005.R1.fq  $output_folder/${x}.wgsim_er0.005.R2.fq
gzip $output_folder/${x}.wgsim_er0.005.R1.fq
gzip $output_folder/${x}.wgsim_er0.005.R2.fq

done
