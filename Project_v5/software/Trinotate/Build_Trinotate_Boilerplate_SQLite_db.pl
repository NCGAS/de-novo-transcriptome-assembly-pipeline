#!/bin/bash

if [ ! $(command -v singularity) ]; then
        module load singularity
fi

VERSION=3.2.1
PACKAGE=trinotate
TOOL=/usr/local/bin/Build_Trinotate_Boilerplate_SQLite_db.pl
DIRECTORY=$PWDHERE/software/Trinotate
STORAGE=/home/ssanders

OPTIONS=$OPTIONS" -B $STORAGE"

singularity exec $OPTIONS $DIRECTORY/singularity-$PACKAGE-$VERSION.sif $TOOL "$@"
