#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

singularity pull docker://ezlabgva/busco:v5.1.3_cv1
mv -v busco*.sif singularity-busco-5.1.3.sif
