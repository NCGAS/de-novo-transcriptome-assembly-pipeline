#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

singularity pull docker://quay.io/biocontainers/soapdenovo-trans:1.04--h5bf99c6_4
mv -v soap*.sif singularity-soapdenovotrans-1.04.sif
