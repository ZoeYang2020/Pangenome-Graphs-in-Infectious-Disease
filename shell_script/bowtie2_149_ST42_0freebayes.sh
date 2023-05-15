#/bin/bash

#module load vcflib/1.0.0
module load freebayes/1.3.4


#set working dir, input_bam_folder and ref_stored_folder
cd $working_dir
bam_file=$input_bam_folder/*.bam
input=$input_bam_folder
ref=$ref_stored_folder/NC_017518.fa


for f in $bam_file

do 

x=$(basename $f .bam)
echo ${x}


freebayes -p 1 -f $ref -C 3  -b $input/${x}.bam > ${x}.vcf

done 
