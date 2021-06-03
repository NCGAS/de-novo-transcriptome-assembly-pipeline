#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

VERSION=14dec30
PACKAGE=evigene
TOOL=/usr/local/evigene14dec30/scripts/prot/trclass2mainalt.pl
DIRECTORY=/home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/EviGene
STORAGE=/home/ssanders

OPTIONS=$OPTIONS" -B $STORAGE"

singularity exec $OPTIONS $DIRECTORY/singularity-$PACKAGE-$VERSION.sif perl $TOOL "$@"
