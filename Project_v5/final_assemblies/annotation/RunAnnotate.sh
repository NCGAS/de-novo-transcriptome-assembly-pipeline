#!/bin/bash 

#SBATCH -J RunAnnotate                                 
#SBATCH -p trinity
#SBATCH -o Annotate_%j.log
#SBATCH -e Annotate_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=ss93@iu.edu
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10gb
#SBATCH --time=01:00:00 

##Move to correct WD
cd /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/final_assemblies/annotation

bash Annotate.sh -p Pcaud
