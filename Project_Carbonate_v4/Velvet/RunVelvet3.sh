#!/bin/bash 

#SBATCH -J RunVelvet3                                  
#SBATCH -p general 
#SBATCH -o filename_%j.txt
#SBATCH -e filename_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=2
#SBATCH --mem=200gb
#SBATCH --time=03:00:00 

##Move to correct WD
cd PWDHERE/Velvet

##load modules
module load velvet/1.2.10
module load oases/0.2.09

#input define
right=PWDHERE/input_files/right-norm.fq
left=PWDHERE/input_files/left-norm.fq

##run code
oases oases.35 &
oases oases.45 &
oases oases.55 &

wait
