#!/bin/bash 

#SBATCH -J RunVelvet3                                  
#SBATCH -p trinity
#SBATCH -o Velvet3_%j.log
#SBATCH -e Velvet3_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=ss93@iu.edu
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=1
#SBATCH --mem=200gb
#SBATCH --time=03:00:00 

##Move to correct WD
cd /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/Velvet

export PATH=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Velvet:$PATH

#input define
reads=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/input_files/reads-norm.fq

##run code
oases oases.35 &
oases oases.45 &
oases oases.55 &

wait
