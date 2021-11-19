#!/bin/bash 

#SBATCH -J RunVelvet2b                                  
#SBATCH -p general
#SBATCH -o Velvet2b_%j.log
#SBATCH -e Velvet2b_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=2
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
velvetg oases.65 -read_trkg yes &
velvetg oases.75 -read_trkg yes &
velvetg oases.85 -read_trkg yes &

wait

sbatch RunVelvet3b.sh
