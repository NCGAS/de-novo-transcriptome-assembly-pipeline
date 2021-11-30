#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

VERSION=14dec30
PACKAGE=evigene
TOOL=/usr/local/evigene14dec30/scripts/prot/tr2aacds.pl
DIRECTORY=$PWDHERE/software/EviGene
STORAGE=/home/ssanders

OPTIONS=$OPTIONS" -B $STORAGE"

singularity exec $OPTIONS $DIRECTORY/singularity-$PACKAGE-$VERSION.sif $TOOL "$@"
