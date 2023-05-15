#!/bin/bash

module load vg/1.46.0
cd $out_path

data_gam=$input_path/*.wgsim_er0.005.vgmap_4Sim.gam
input=$input_path
#input2=/home/zyang/NGS/scratch/IPL/MENINGO/graph_test_zoe/mapping_graph0.5.3_ref_sim128e/vgmap_Sim128e_Sim4_nofilcall_allR_R10S3_aug
output=$out_dir
graph_vg=$input_path2/4Sim_pggb0.5.3_1k96_256.vg
graph_xg=$input_path2/4Sim_pggb0.5.3_1k96_256.xg


#compute snarls
#vg snarls $graph_xg >$output/${graph_xg}.snarls

for f in $data_gam
do 

x=$(basename $f .wgsim_er0.005.vgmap_4Sim.gam)
echo ${x}


#Augment augment the graph with all variation from the GAM, saving to aug.vg
### augment the graph with all variation from the GAM except 
### that implied by soft clips, saving to aug.vg
### *aug-gam contains the same reads as aln.gam but mapped to aug.vg

vg augment -t 48 $graph_vg $input/${x}.wgsim_er0.005.vgmap_4Sim.gam -A $output/${x}nofilt_aug.gam >$output/${x}nofilt_aug.vg

#index the augmented graph
vg index -t 48 $output/${x}nofilt_aug.vg -x $output/${x}nofilt_aug.xg

## Compute the all read support from the augmented gam (ignoring qualitiy < 5
vg pack -t 48 -x $output/${x}nofilt_aug.xg -g $output/${x}nofilt_aug.gam  -o $output/${x}nofilt_aug_allR.pack


#call variant
vg call -t 48 -m 3,10 $output/${x}nofilt_aug.xg -k $output/${x}nofilt_aug_allR.pack >$output/${x}nofilt_aug_allR.pack.vcf

#call variant snarl using the same coordinate
vg call -t 48 -m 3,10 $output/${x}nofilt_aug.xg -k $output/${x}nofilt_aug_allR.pack -a >$output/${x}nofilt_aug_allR.pack_snarls.vcf

done 
