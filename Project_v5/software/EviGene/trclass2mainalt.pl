#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

VERSION=14dec30
PACKAGE=evigene
TOOL=/usr/local/evigene14dec30/scripts/prot/trclass2mainalt.pl
DIRECTORY=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/EviGene
STORAGE=/N/slate,/N/project,/N/u

OPTIONS=$OPTIONS" -B $STORAGE"

singularity exec $OPTIONS $DIRECTORY/singularity-$PACKAGE-$VERSION.sif perl $TOOL "$@"
