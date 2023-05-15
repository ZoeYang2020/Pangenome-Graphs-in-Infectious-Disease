#!/bin/bash

module load pggb/0.5.3_docker
#set the path where the genomes are 
input=

pggb -i $input/4Sim.fa -s 1000 -p 96 -n 4 -t 48 -S -m -o 4Sim_pggb0.5.3_1K96_D

