#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

VERSION=5.0.2
PACKAGE=quast
TOOL=quast.py
DIRECTORY=/home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/Quast
STORAGE=/home/ssanders

OPTIONS=$OPTIONS" -B $STORAGE"

singularity exec $OPTIONS $DIRECTORY/singularity-$PACKAGE-$VERSION.sif $TOOL "$@"
