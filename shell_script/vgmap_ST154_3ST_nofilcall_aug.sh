!/bin/bash

module load vg/1.46.0
cd $out_path


data_gam=$input_path/*vgmap_3ST.gam
input=$input_path
output=$out_path
graph_vg=$input_path2/3ST_pggb0.5.3_2k95_256.vg
graph_xg=$input_path2/3ST_pggb0.5.3_2k95_256.xg


#compute snarls
#vg snarls $graph_xg >$output/${graph_xg}.snarls

for f in $data_gam
do 

x=$(basename $f vgmap_3ST.gam)
echo ${x}


vg augment -t 48 $graph_vg $input/${x}vgmap_3ST.gam -A $output/${x}nofilt_aug.gam >$output/${x}nofilt_aug.vg

#index the augmented graph
vg index -t 48 $output/${x}nofilt_aug.vg -x $output/${x}nofilt_aug.xg

## Compute the read support from the augmented gam (ignoring qualitiy < 5
vg pack -t 48 -x $output/${x}nofilt_aug.xg -g $output/${x}nofilt_aug.gam -o $output/${x}nofilt_aug.pack


#call variant
vg call -t 48 $output/${x}nofilt_aug.xg -k $output/${x}nofilt_aug.pack >$output/${x}nofilt_aug.pack.vcf

#call variant snarl using the same coordinate
vg call -t 48 $output/${x}nofilt_aug.xg -k $output/${x}nofilt_aug.pack -a >$output/${x}nofilt_aug.pack_snarls.vcf

done 
