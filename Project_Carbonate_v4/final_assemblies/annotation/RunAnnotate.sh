#!/bin/bash 

#SBATCH -J RunAnnotate                                 
#SBATCH -p general 
#SBATCH -o filename_%j.txt
#SBATCH -e filename_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10gb
#SBATCH --time=01:00:00 

##Move to correct WD
cd PWDHERE/final_assemblies/annotation

./Annotate.sh -p GENE
