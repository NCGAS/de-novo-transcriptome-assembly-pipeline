#!/bin/bash 

#SBATCH -J RunVelvet2                                  
#SBATCH -p trinity
#SBATCH -o Velvet2_%j.log
#SBATCH -e Velvet2_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=ss93@iu.edu
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=1
#SBATCH --mem=200gb
#SBATCH --time=03:00:00 

##Move to correct WD
cd /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/Velvet
source ../setup_files/path_set 

export PATH=/home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/Velvet:$PATH

#input define
reads=/home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/input_files/reads-norm.fq

##run code
velvetg oases.35 -read_trkg yes  &
velvetg oases.45 -read_trkg yes  &
velvetg oases.55 -read_trkg yes  &

wait

sbatch RunVelvet3.sh
