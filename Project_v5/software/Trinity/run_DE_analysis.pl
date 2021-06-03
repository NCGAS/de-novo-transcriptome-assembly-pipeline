#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

VERSION=2.11.0
PACKAGE=Trinity
TOOL=/usr/local/bin/trinityrnaseq/Analysis/DifferentialExpression/run_DE_analysis.pl
DIRECTORY=$PWDHERE/software/Trinity
STORAGE=/home/ssanders

OPTIONS=$OPTIONS" -B $STORAGE"

singularity exec $OPTIONS $DIRECTORY/singularity-$PACKAGE-$VERSION.sif $TOOL "$@"
