#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

singularity pull docker://ss93/transabyss-2.0.1:latest
mv -v transabyss*.sif singularity-transabyss-2.0.1.sif
