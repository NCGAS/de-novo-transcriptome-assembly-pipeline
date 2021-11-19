#!/bin/bash 

#SBATCH -J RunVelvet3b                                
#SBATCH -p general
#SBATCH -o Velvet3b_%j.log
#SBATCH -e Velvet3b_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=1
#SBATCH --mem=200gb
#SBATCH --time=03:00:00 

##Move to correct WD
source ../setup_files/path_set 
cd $PWDHERE/Velvet

export PATH=$PATH:$PWDHERE/software/Velvet

#input define
reads=$PWDHERE/input_files/reads-norm.fq

##run code
oases oases.65 &
oases oases.75 &
oases oases.85 &

wait
