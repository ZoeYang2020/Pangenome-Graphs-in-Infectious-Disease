#!/bin/bash


module load samtools/1.4


data=$data_folder/*.fa 
output_folder=
input_folder=


for f in $data 

do

x=$(basename $f .fa)
echo ${x}

wgsim $input_foldr/${x}.fa -N 1000000 -1 150 -2 150  -e 0.005 -r 0 -R 0 -X 0 $output_folder/${x}.wgsim_er0.005.R1.fq  $output_folder/${x}.wgsim_er0.005.R2.fq
gzip $output_folder/${x}.wgsim_er0.005.R1.fq
gzip $output_folder/${x}.wgsim_er0.005.R2.fq

done
