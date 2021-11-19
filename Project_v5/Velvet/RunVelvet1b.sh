#!/bin/bash 

#SBATCH -J RunVelvet1b                                   
#SBATCH -p general
#SBATCH -o Velvet1b_%j.log
#SBATCH -e Velvet1b_%j.err 
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
velveth oases.65 65 -short -fastq $reads &
velveth oases.75 75 -short -fastq $reads &
velveth oases.85 85 -short -fastq $reads &

wait

sbatch RunVelvet2b.sh
