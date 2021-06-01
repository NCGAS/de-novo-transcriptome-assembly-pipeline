#!/bin/bash

if [ ! $(command -v singularity) ]; then
        module load singularity
fi

#singularity pull docker://quay.io/biocontainers/trinotate:3.2.1--pl5262hdfd78af_1
singularity pull docker://ss93/trinotate-3.2.1
mv trinotate*.sif singularity-trinotate-3.2.1.sif
