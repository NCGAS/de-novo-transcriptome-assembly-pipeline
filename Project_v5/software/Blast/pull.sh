#!/bin/bash

if [ ! $(command -v singularity) ]; then
        module load singularity
fi

singularity pull docker://ncbi/blast
mv blast_latest.sif singularity-blast-2.11.0.sif
