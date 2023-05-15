#!/bin/bash

module load vg/1.46.0
cd $out_path

data_gam=$input_path/*.wgsim_er0.005.vgmap_4Sim.gam
input=$input_path
output=$out_dir
graph_xg=$input_path1/4Sim_pggb0.5.3_1k96_256.xg
snarls_file=$input_path1/4Sim_pggb0.5.3_1k96_256.xg.snarls



#compute snarls
#vg snarls $graph_xg >$snarls_file

for f in $data_gam
do 

x=$(basename $f .wgsim_er0.005.vgmap_4Sim.gam)
echo ${x}


#Calculate the surpport reads ingoring mapping and base quality <5
#vg pack -t 48 -x $graph_xg -g $input/${x}.wgsim_er0.005.vgmap_4Sim.gam -Q 5 -o $output/${x}vgmap_Sim4_256_aln.pack
vg pack -t 48 -x $graph_xg -g $input/${x}.wgsim_er0.005.vgmap_4Sim.gam -o $output/${x}vgmap_Sim4_256_aln.pack


#call variant using the same coordinates and including reference calls (for following compare)
vg call -t 60 -m 3,10 $graph_xg -k $output/${x}vgmap_Sim4_256_aln.pack -r $snarls_file -a  >$output/${x}vgmap_Sim4_256_aln.pack_allR10S3.vcf 

done
