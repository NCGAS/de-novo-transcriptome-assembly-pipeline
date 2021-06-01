#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

VERSION=2.11.0
PACKAGE=Trinity
TOOL=/usr/local/bin/trinityrnaseq/Analysis/DifferentialExpression/run_DE_analysis.pl
DIRECTORY=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Trinity
STORAGE=/N/slate,/N/project,/N/u

OPTIONS=$OPTIONS" -B $STORAGE"

singularity exec $OPTIONS $DIRECTORY/singularity-$PACKAGE-$VERSION.sif $TOOL "$@"
