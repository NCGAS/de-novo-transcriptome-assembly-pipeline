#!/bin/bash

wget -nc https://data.broadinstitute.org/Trinity/TRINITY_SINGULARITY/trinityrnaseq.v2.11.0.simg
mv -v trinityrnaseq.v2.11.0.simg singularity-Trinity-2.11.0.sif
