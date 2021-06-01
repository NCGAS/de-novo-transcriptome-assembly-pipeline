#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

singularity pull docker://staphb/quast:latest
mv -v quast*.sif singularity-quast-5.0.2.sif
