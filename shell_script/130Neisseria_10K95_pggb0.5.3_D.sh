#!/bin/bash

module load pggb/0.5.3_docker
#set input path where the genomes are 
input=

pggb -i $input/130NM_genomes.fa -s 10000 -p 95 -n 130 -t 48 -S -m -o 130NM_pggb0.5.3_10K0.95_D

