!/bin/bash

module load vg/1.46.0
cd $out_path


data_gam=$input_path/*vgmap_3ST.gam
input=$input_path
output=$input_path1
output2=$out_path
graph_vg=$input_path2/3ST_pggb0.5.3_2k95_256.vg
graph_xg=$input_path2/3ST_pggb0.5.3_2k95_256.xg


#compute snarls
#vg snarls $graph_xg >$output/${graph_xg}.snarls

for f in $data_gam
do 

x=$(basename $f vgmap_3ST.gam)
echo ${x}




#call variant
vg call -t 48 -m 3,10 $output/${x}nofilt_aug.xg -k $output/${x}nofilt_aug.pack >$output2/${x}nofilt_aug.pack_10RS3.vcf

#call variant snarl using the same coordinate
vg call -t 48 -m 3,10 $output/${x}nofilt_aug.xg -k $output/${x}nofilt_aug.pack -a >$output2/${x}nofilt_aug.pack_snarls_10RS3.vcf

done 
