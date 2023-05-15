#!/bin/bash 

module load odgi/0.8.3

odgi similarity -i ./130NM_10k95_0.5.3Dx.gfa -t 32  -P > 130NM_10k95_0.5.3Dx_distance

cut -f 1,2,6 130NM_10k95_0.5.3Dx_distance >130NM_10k95_0.5.3Dx_distance_cut
