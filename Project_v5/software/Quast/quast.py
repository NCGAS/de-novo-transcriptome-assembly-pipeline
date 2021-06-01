#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

VERSION=5.0.2
PACKAGE=quast
TOOL=quast.py
DIRECTORY=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Quast
STORAGE=/N/home,/N/slate,/N/project

OPTIONS=$OPTIONS" -B $STORAGE"

singularity exec $OPTIONS $DIRECTORY/singularity-$PACKAGE-$VERSION.sif $TOOL "$@"
