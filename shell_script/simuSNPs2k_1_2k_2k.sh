#!/bin/bash 

#simu2Ksnps

cd $out_path
data=$input_path/*.fa
input_folder=$input_path
mkdir simu_random_SNPs_2K_8genomes2k_1_2k_2k


for f in $data
do

##change [common_bits_of_yourfile] common bits of your file name, delete brackets for example for processed_ARL09-165_S1_L001_R1_001.fastq, change [common_bits_of_yourfile] to _L001_R1_001.fastq, delete brackets

x=$(basename $f .fa)
echo ${x}

#read1=${x}_R1_P.fastq.gz
#read2=$(echo $read1|sed 's/_R1_P.fastq.gz/_R2_P.fastq.gz/')

#echo $read2

perl simuG.pl -refseq $input_folder/${x}.fa -snp_count 2000 -prefix ${x}_2k 

cat ${x}_2k.simseq.genome.fa |sed 's/'${x}'/'${x}_2k'/g' >${x}_2k.fa 


mv ${x}_2k* ./simu_random_SNPs_2K_8genomes2k_1_2k_2k

cd  ./simu_random_SNPs_2K_8genomes2k_1_2k_2k 
#mv ${x}_2k_1_2k.simseq.genome.fa ${x}_2k_1_2k.fa
rm ${x}_2k.simseq.genome.fa 
mv ${x}_2k.refseq2simseq.map.txt ${x}_2k.map.txt
mv ${x}_2k.refseq2simseq.SNP.vcf ${x}_2k.snp.vcf 

cd ..
 
#perl simuG.pl -refseq NMI01191_mutFromRef.fa -indel_count 200 -prefix NMI01191_mutFromRef_indels200
#perl simuG.pl -refseq NMI97349_mutFromRef.fa -indel_count 200 -prefix NMI94348_mutFromRef_indels200
#perl simuG.pl -refseq NC_017518.fa -snp_count 5000 -indel_count 200 -prefix NC_017518_5Ksnps_indels200

done
