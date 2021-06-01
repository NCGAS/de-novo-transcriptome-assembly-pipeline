#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

singularity pull docker://ss93/hmmer-3.1b
mv -v hmmer*.sif singularity-hmmer-3.1b.sif
