!/bin/bash

module load pggb/0.5.3_docker

#set the path where the genomes are 
input=

pggb -i $input/3ST.fa -s 2000 -p 95 -n 3 -t 48 -S -m -o 3ST_pggb0.5.3D_2K0.95D

