#/bin/bash

#module load vcflib/1.0.0
module load freebayes/1.3.4


#set working dir, input_bam_folder and ref_stored_folder
cd $working_dir
bam_file=$input_bam_folder/*.wgsim_er0.005.bam
input=$input_bam_folder
ref=$ref_stored_folder/NC_017518.fa

for f in $bam_file

do 

x=$(basename $f .wgsim_er0.005.bam)
echo ${x}


freebayes -p 1 -f $ref -C 3  -b $input/${x}.wgsim_er0.005.bam > ${x}.vcf

done 
