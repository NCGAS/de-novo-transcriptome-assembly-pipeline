#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

singularity pull docker://ss93/evigene-14dec30:latest
mv -v evigene*.sif singularity-evigene-14dec30.sif
