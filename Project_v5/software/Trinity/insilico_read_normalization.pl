#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

VERSION=2.11.0
PACKAGE=Trinity
TOOL=/usr/local/bin/trinityrnaseq/util/insilico_read_normalization.pl
DIRECTORY=/N/project/ncgas/staff_sandboxes/ss93/PSCcontainer_trials/Trinity
STORAGE=/N/slate,/N/project,/N/u

OPTIONS=$OPTIONS" -B $STORAGE"

singularity exec $OPTIONS $DIRECTORY/singularity-$PACKAGE-$VERSION.sif $TOOL "$@"

