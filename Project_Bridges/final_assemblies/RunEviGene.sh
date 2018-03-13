#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=YOUREMAILHERE
#SBATCH --job-name="evigene"
#SBATCH --partition=LM
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --time=12:00:00
#SBATCH --mem=300GB

#echo commands to stdout
set -x

##Move to correct WD
cd PWDHERE/final_assemblies

module load cd-hit/2016.06.21
export PATH=/opt/packages/evigene/evigene/scripts/prot:$PATH

export BLASTDV=$BLASTDB


tr2aacds.pl -tidy -NCPU 3 -MAXMEM 131072 -log -cdna combined.fa
