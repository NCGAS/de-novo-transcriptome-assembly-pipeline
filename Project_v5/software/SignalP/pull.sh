#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

singularity pull docker://ss93/signalp-4.1g:latest
mv -v signalp*.sif singularity-signalp-4.1g.sif
