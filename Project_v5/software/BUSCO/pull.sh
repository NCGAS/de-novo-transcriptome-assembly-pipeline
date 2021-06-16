#!/bin/bash

source ../../setup_files/path_set

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

singularity pull https://depot.galaxyproject.org/singularity/busco:5.1.3--pyhdf>
mv -v busco:* singularity-busco-5.1.3.sif
