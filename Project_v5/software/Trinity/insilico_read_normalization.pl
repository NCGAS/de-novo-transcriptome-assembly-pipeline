#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

VERSION=2.11.0
PACKAGE=Trinity
TOOL=/usr/local/bin/trinityrnaseq/util/insilico_read_normalization.pl
DIRECTORY=$PWDHERE/software/Trinity
STORAGE=/home/ssanders

OPTIONS=$OPTIONS" -B $STORAGE"

singularity exec $OPTIONS $DIRECTORY/singularity-$PACKAGE-$VERSION.sif $TOOL "$@"

