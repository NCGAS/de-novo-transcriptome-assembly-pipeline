#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

singularity pull docker://quay.io/biocontainers/velvet:1.2.10--h5bf99c6_4
mv -v velvet_*.sif singularity-velvet-1.2.10.sif

singularity pull docker://quay.io/biocontainers/oases:0.2.09--h470a237_1
mv -v oases*.sif singularity-oases-0.2.09.sif

