#!/bin/bash 

#SBATCH -J RunAnnotate                                 
#SBATCH -p general
#SBATCH -o Annotate_%j.log
#SBATCH -e Annotate_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10gb
#SBATCH --time=01:00:00 

##Move to correct WD
source ../../setup_files/path_set 
cd $PWDHERE/final_assemblies/annotation

bash ./scripts/Annotate.sh -p GENE
