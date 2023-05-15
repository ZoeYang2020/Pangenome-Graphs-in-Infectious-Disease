#!/bin/bash 

#simu2Ksnps

cd $out_path 

data=$input_path/*.fa

mkdir simu_random_SNPs_2K_8genomes2k_4


for f in $data
do

##change [common_bits_of_yourfile] common bits of your file name, delete brackets for example for processed_ARL09-165_S1_L001_R1_001.fastq, change [common_bits_of_yourfile] to _L001_R1_001.fastq, delete brackets

x=$(basename $f .fa)
echo ${x}

#read1=${x}_R1_P.fastq.gz
#read2=$(echo $read1|sed 's/_R1_P.fastq.gz/_R2_P.fastq.gz/')

#echo $read2

perl simuG.pl -refseq ${x}.fa -snp_count 2000 -prefix ${x}_2k_4 

cat ${x}_2k_4.simseq.genome.fa |sed 's/'${x}'/'${x}_2k_4'/g' >${x}_2k_4.fa 


mv ${x}_2k_4* ./simu_random_SNPs_2K_8genomes2k_4

cd  ./simu_random_SNPs_2K_8genomes2k_4 
#mv ${x}_2k_4.simseq.genome.fa ${x}_2k_4.fa
rm ${x}_2k_4.simseq.genome.fa 
mv ${x}_2k_4.refseq2simseq.map.txt ${x}_2k_4.map.txt
mv ${x}_2k_4.refseq2simseq.SNP.vcf ${x}_2k_4.snp.vcf 

cd ..
 
#perl simuG.pl -refseq NMI01191_mutFromRef.fa -indel_count 200 -prefix NMI01191_mutFromRef_indels200
#perl simuG.pl -refseq NMI97349_mutFromRef.fa -indel_count 200 -prefix NMI94348_mutFromRef_indels200
#perl simuG.pl -refseq NC_017518.fa -snp_count 5000 -indel_count 200 -prefix NC_017518_5Ksnps_indels200

done
