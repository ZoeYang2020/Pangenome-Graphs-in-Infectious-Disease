#!/bin/bash 

module load vg/1.46.0
module load vcflib/1.0.0

gfa=$input_path/*.gfa

for f in $gfa

do

x=$(basename $f .gfa)
echo ${x}
 
vg deconstruct -p NC_017518  -a -e -K ${x}.gfa > ${x}aekp1_vcf
vcfstats ${x}aekp1_vcf >${x}aekp1_vcf_stats


done

