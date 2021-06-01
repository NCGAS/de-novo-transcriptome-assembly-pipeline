#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

singularity pull docker://ghcr.io/autamus/kallisto:latest
mv -v kallisto*.sif singularity-kallisto-0.46.2.sif
