#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

singularity pull docker://ss93/tmhmm:latest
mv -v *.sif singularity-tmhmm-2.0c.sif
