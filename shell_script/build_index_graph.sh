#!/bin/bash

module load vg/1.46.0


cd $out_path

data=$input_path/*.gfa  
tem_dir=$out_path/temp_dir



for f in $data 
do 

x=$(basename $f .gfa)
echo ${x}temp_dir


#convert the graph into 256 bp chunks 
vg mod -X 256 ${x}.gfa >${x}_256.vg 
vg index -b $tem_dir -t 48 -x ${x}_256.xg -g ${x}_256.gcsa -k 16 ${x}_256.vg 


done  
